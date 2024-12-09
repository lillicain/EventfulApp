//
//  ChatLogViewModel.swift
//  EventfulApp
//
//  Created by Lilli Cain on 12/9/24.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class ChatLogViewModel: ObservableObject {
    @Published var chatText = ""
    @Published var errorMessage = ""
    @Published var chatMessages = [ChatMessage]()
    @Published var count = 0
    
    let dbProfile: DBProfile?
    
    private let firebaseMessagerManager: FirebaseMessagerManager
    
    init(firebaseMessagerManager: FirebaseMessagerManager) {
        self.firebaseMessagerManager = firebaseMessagerManager
        
    }
    
    
    
    
    init(dbProfile: DBProfile?) {
        self.dbProfile = dbProfile
        fetchMessages()
    }
    
    private func fetchMessages() {
        guard let fromId = FireBaseManager.shared.auth.currentUser?.uid,
              let toId = dbProfile?.id else { return }
        
        FireBaseManager.shared.firestore.collection("messages")
            .document(fromId)
            .collection(toId)
            .order(by: FireBaseConstants.timestamp)
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    self.errorMessage = "Failed to listen for messages: \(error)"
                    print(error)
                    return
                }
                
                querySnapshot?.documentChanges.forEach { change in
                    if change.type == .added {
                        let data = change.document.data()
                        let message = ChatMessage(documentId: change.document.documentID, data: data)
                        if !self.chatMessages.contains(where: { $0.documentId == message.documentId }) {
                            self.chatMessages.append(message)
                        }
                    }
                }
                DispatchQueue.main.async {
                    self.chatMessages.sort { $0.timestamp.dateValue() < $1.timestamp.dateValue() }
                    self.count += 1
                }
            }
    }
    
    func handleSend() {
        guard let fromId = FireBaseManager.shared.auth.currentUser?.uid,
              let toId = dbProfile?.id else { return }
        
        let textToSend = self.chatText
        self.chatText = ""
        
        let messageData: [String: Any] = [
            FireBaseConstants.fromId: fromId,
            FireBaseConstants.toId: toId,
            FireBaseConstants.text: textToSend,
            FireBaseConstants.timestamp: Timestamp()
        ]
        
        saveMessage(fromId: fromId, toId: toId, data: messageData)
        saveMessage(fromId: toId, toId: fromId, data: messageData)
        
        persistRecentMessage(textToSend)
    }
    
    private func saveMessage(fromId: String, toId: String, data: [String: Any]) {
        FireBaseManager.shared.firestore.collection("messages")
            .document(fromId)
            .collection(toId)
            .document()
            .setData(data) { error in
                if let error = error {
                    self.errorMessage = "Failed to save messages: \(error)"
                }
            }
    }
    
    private func persistRecentMessage(_ text: String) {
        guard let dbProfile = dbProfile,
              let uid = FireBaseManager.shared.auth.currentUser?.uid,
              let toId = dbProfile.id else { return }
        
        let data: [String: Any] = [
            FireBaseConstants.timestamp: Timestamp(),
            FireBaseConstants.text: text,
            FireBaseConstants.fromId: uid,
            FireBaseConstants.toId: toId,
            "profileImageUrl": dbProfile.photoURL ?? "",
            "email": dbProfile.email ?? ""
        ]
        
        FireBaseManager.shared.firestore.collection("recent_messages")
            .document(uid)
            .collection("messages")
            .document(toId)
            .setData(data) { error in
                if let error = error {
                    self.errorMessage = "Failed to save recent message: \(error)"
                    print(error)
                }
            }
    }
}
