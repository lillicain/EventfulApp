//
//  DBProfile.swift
//  EventfulApp
//
//  Created by Lilli Cain on 12/9/24.
//

import Foundation
import Foundation
import FirebaseFirestore
import FirebaseAuth

struct DBProfile: Codable, Hashable {
    let id: String
    let email: String?
    let photoURL: String?
    let name: String?
    let dateCreated: Date
    let interests: [String]
    let rsvps: [String]
    let swipes: [String]
    let eventsAttended: [String]
    let eventsHosted: [String]
    init (auth: AuthDataResultModel) {
        let user = auth.user
         self.id = auth.uid
         self.email = auth.email
        self.photoURL = auth.photoUrl
        self.name = auth.email
         self.dateCreated = Date()
         self.interests = []
         self.rsvps = []
         self.swipes = []
         self.eventsAttended = []
         self.eventsHosted = []
    }
    init(
        id: String,
        email: String,
        photoURL: String? = nil,
        name: String? = nil,
        dateCreated: Date,
        interests: [String] = [],
        rsvps: [String] = [],
        swipes: [String] = [],
        eventsAttended: [String] = [],
        eventsHosted: [String] = []
    ) {
        self.id = id
        self.email = email
        self.photoURL = photoURL
        self.name = name
        self.dateCreated = dateCreated
        self.interests = interests
        self.rsvps = rsvps
        self.swipes = swipes
        self.eventsAttended = eventsAttended
        self.eventsHosted = eventsHosted
    }
    enum CodingKeys: String, CodingKey {
        case id = "id" // Firestore uses the same name.
        case email = "email" // Firestore uses the same name.
        case photoURL = "photo_url" // Map Swift's camelCase to Firestore's snake_case.
        case name = "name" // Firestore uses the same name.
        case dateCreated = "date_created" // Map camelCase to snake_case.
        case interests = "interests" // Firestore uses the same name.
        case rsvps = "rsvps" // Firestore uses the same name.
        case swipes = "swipes" // Firestore uses the same name.
        case eventsAttended = "events_attended" // Map camelCase to snake_case.
        case eventsHosted = "events_hosted" // Map camelCase to snake_case.
    }
}
