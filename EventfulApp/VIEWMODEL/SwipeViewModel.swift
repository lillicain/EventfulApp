//
//  SwipeViewModel.swift
//  EventfulApp
//
//  Created by Lilli Cain on 11/6/24.
//

import SwiftUI

public class SwipeViewModel: ObservableObject {
    
    @Published var event: Event
    @Published var information: [String]
    @Published var state = EventState.loading
    @Published var catalogs: [String] = []
    
    var title: String = ""
    
    init(event: Event, information: [String], title: String, state: EventState = EventState.loading, catalogs: [String]) {
        self.event = event
        self.information = information
        self.title = title
        self.state = state
        self.catalogs = catalogs
    }
    
//    init(title: String) {
//        self.title = title
//        
//        if information.isEmpty {
//            information.insert(contentsOf: information)
//        }
//    }
    
    @ViewBuilder
    private var View: some View {
        Text("Event")
        HStack(alignment: .center, spacing: 10) {
            if catalogs.count > 0 {
                Text("Event Items")
            }
        }
    }
    
    func insert(username: String, color: Color) {
        information.insert(contentsOf: information, at: 0)
    }
}
