////
////  FirebaseAuthenticationManager.swift
////  EventfulApp
////
////  Created by Lilli Cain on 12/9/24.
////
//
//import Foundation
//import FirebaseAuth
//
//class FirebaseAuthenticationManager {
//    init() {}
//
//    func getAuthenticatedUser() -> AuthDataResultModel? {
//        guard let user = Auth.auth().currentUser else {
//            return nil
//        }
//        return AuthDataResultModel(user: user)
//    }
//    
//    /// Sign out the currently logged-in user.
//    func signOut() throws {
//        try Auth.auth().signOut()
//    }
//    
//    /// Delete the currently authenticated user's account.
//    func deleteAccount() async throws {
//        guard let user = Auth.auth().currentUser else {
//            throw URLError(.badServerResponse)
//        }
//        try await user.delete()
//    }
//    
//    /// Create a new user with email and password.
//    @discardableResult
//    func createUser(email: String, password: String) async throws -> AuthDataResultModel {
//        let authResult = try await Auth.auth().createUser(withEmail: email, password: password)
//        return AuthDataResultModel(user: authResult.user)
//    }
//    
//    /// Log in a user with email and password.
//    @discardableResult
//    func signIn(email: String, password: String) async throws -> AuthDataResultModel {
//        let authResult = try await Auth.auth().signIn(withEmail: email, password: password)
//        return AuthDataResultModel(user: authResult.user)
//    }
//    
//    /// Reset the password for a user by email.
//    func resetPassword(email: String) async throws {
//        try await Auth.auth().sendPasswordReset(withEmail: email)
//    }
//}
