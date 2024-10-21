//
//  SearchViewModel.swift
//  EventfulApp
//
//  Created by Lilli Cain on 10/21/24.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task {
            try await fetchAllUsers()
        }
    }
    
    @MainActor
    func fetchAllUsers() async throws {
//        self.users = try await UserManager.fetchAllUsers()
    }
}
