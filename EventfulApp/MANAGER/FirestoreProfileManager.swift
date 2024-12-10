//
//  FirestoreProfileManager.swift
//  EventfulApp
//
//  Created by Lilli Cain on 12/9/24.
//

import Foundation
import FirebaseFirestore

class FirestoreProfileManager {
    
//    let db = Firestore.firestore()
    
    private let profileCollection = Firestore.firestore().collection("profiles")
    
    private func profileDocument(userId: String) -> DocumentReference {
        profileCollection.document(userId)
    }
    
    func createNewProfile(user: DBProfile) async throws {
        try profileDocument(userId: user.id).setData(from: user, merge: false)
    }
    
    func getUser(userId: String) async throws -> DBProfile {
        try await profileDocument(userId: userId).getDocument(as: DBProfile.self)
    }
    
    func rsvp(event: String, userId: String) async throws {
        
    }
    
    func swipe(event: String, userId: String) async throws {
        
    }
    
    func addInterest(interests: [String]) async throws {
        
    }
}
