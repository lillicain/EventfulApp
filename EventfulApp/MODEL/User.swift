//
//  User.swift
//  EventfulApp
//
//  Created by Lilli Cain on 10/21/24.
//

import Foundation
import Firebase
import FirebaseAuth

struct User: Identifiable, Hashable, Codable {
    let id: String
    let username: String
    let email: String
    var name: String?
    var profileImage: String?
    var profileInformation: String?
   
    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == id
    }
}

extension User {
    static var MOCK_USER: [User] = [
        .init(id: NSUUID().uuidString, username: "App", email: "app@support.com", name: "App"),
        .init(id: NSUUID().uuidString, username: "User", email: "user@support.com", name: "User", profileInformation: "User"),
        .init(id: NSUUID().uuidString, username: "Account", email: "account@support.com", name: "Account", profileInformation: "Account")
    ]
}
