//
//  ChatMessage.swift
//  EventfulApp
//
//  Created by Lilli Cain on 12/9/24.
//

import Foundation
import FirebaseFirestore

struct ChatMessage: Identifiable {
    let id: String
    let fromId: String
    let toId: String
    let text: String
    let timestamp: Timestamp
    
    init(documentId: String, data: [String: Any]) {
        self.id = documentId
        self.fromId = data[FirebaseConstants.fromId] as? String ?? ""
        self.toId = data[FirebaseConstants.toId] as? String ?? ""
        self.text = data[FirebaseConstants.text] as? String ?? ""
        self.timestamp = data[FirebaseConstants.timestamp] as? Timestamp ?? Timestamp()
    }
}
