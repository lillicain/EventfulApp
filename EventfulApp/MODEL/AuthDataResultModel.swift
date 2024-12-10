//
//  AuthDataResultModel.swift
//  EventfulApp
//
//  Created by Lilli Cain on 12/9/24.
//

import Foundation
import FirebaseAuth

struct AuthDataResultModel {
    let uid: String
    let email: String?
    let photoUrl: String?
    
    init(user: User) {
        self.uid = user.id
        self.email = user.email
        self.photoUrl = user.profileImage
    }
}
