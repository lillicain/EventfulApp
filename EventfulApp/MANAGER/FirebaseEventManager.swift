//
//  FirebaseEventManager.swift
//  EventfulApp
//
//  Created by Lilli Cain on 12/9/24.
//

import Foundation
import FirebaseFirestore

@Observable
class FirestoreEventManager {
    let db = Firestore.firestore()
    static func saveEvent(event: Event) async -> String? {
        let db = Firestore.firestore()
        
        if let id = event.id {
            do {
                try db.collection("events").document(id).setData(from: event)
                print("Data updated successfully.")
                return id
            } catch {
                print("Could not update data in events: \(error.localizedDescription)")
                return id
            }
        } else {
            do {
                let docRef = try db.collection("events").addDocument(from: event)
                print("Data updated successfully.")
                return docRef.documentID
            } catch {
                print("Could not create a new event in events: \(error.localizedDescription)")
                return nil
            }
        }
    }
    
    static func deleteEvent(event: Event) {
        let db = Firestore.firestore()
        
        guard let id = event.id else {
            print("No event.id")
            return
        }
        
        Task {
            do {
                try await db.collection("events").document(id).delete()
            } catch {
                print("ERROR: Could not delete document \(id). \(error.localizedDescription)")
            }
        }
    }
    
    func fetchEvents() async -> [Event] {
        let db = Firestore.firestore()
        var events: [Event] = []
        
        do {
            // Query Firestore to fetch 5 events
            let snapshot = try await db.collection("events")
                .limit(to: 5) // Limit to 5 documents
                .getDocuments()
            
            // Convert each document into an Event object
            events = snapshot.documents.compactMap { document in
                try? document.data(as: Event.self) // Decode Firestore data into Event
            }
            
            print("Successfully fetched events!")
        } catch {
            print("Error fetching events: \(error.localizedDescription)")
        }
        
        return events
    }

}

