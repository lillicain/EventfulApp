//
//  PostItemViewModel.swift
//  EventfulApp
//
//  Created by Lilli Cain on 10/21/24.
//

import Foundation

class PostItemViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    let user: User
    
    init(user: User) {
        self.user = user
        Task {
            try await fetchUserPosts()
        }
    }
    
    @MainActor
    func fetchUserPosts() async throws {
//        self.posts = try await PostManager.fetchUserPosts(uid: user.id)
        for index in 0..<posts.count {
            posts[index].user = self.user
        }
    }
}
