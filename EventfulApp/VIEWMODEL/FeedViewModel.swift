//
//  FeedViewModel.swift
//  EventfulApp
//
//  Created by Lilli Cain on 10/21/24.
//

import Foundation
import Firebase
import FirebaseFirestore

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    static let shared = FeedViewModel()
    
    init() {
        Task {
            try await fetchPosts()
        }
    }
   
    @MainActor
    func fetchPosts() async throws {
        let snapshot = try await Firestore.firestore().collection("posts").getDocuments()
        self.posts = try snapshot.documents.compactMap({ try $0.data(as: Post.self) })
        
        for index in 0..<posts.count {
            let post = posts[index]
            let userUid = post.userUid
            let postUser = try await UserManager.fetchUser(withUid: userUid)
            posts[index].user = postUser
        }
    }
}
