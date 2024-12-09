//
//  SwipeViewModel.swift
//  EventfulApp
//
//  Created by Lilli Cain on 11/6/24.
//

import SwiftUI
import Foundation
import FirebaseFirestore

    @Observable
    class SwipeViewViewModel{
        
        var events: [Event] = []
        var isLoading = false
        var showInfo = false
        private let fireStoreManager: FirestoreEventManager
        
        init(fireStoreManager: FirestoreEventManager) {
            self.fireStoreManager = fireStoreManager
            fetchEventCards()
        }
        func fetchEventCards() {
            self.isLoading = true
            Task {
                let fetchedEvents = await fireStoreManager.fetchEvents()
                DispatchQueue.main.async {
                    self.events = fetchedEvents
                    self.isLoading = false
                }
            }
            // Put manager functionality here with do and catch shi
        }
        func rsvp() {
            
        }
        func swipeLeft(_ card: Event) {
            showInfo = false
            
            
        }
        func swipeRight(_ card: Event) {
            showInfo = false
            
        }
        
        func toggleInfo(){
            showInfo = true
            print("\(currentEvent.title)")
        }
        func removeEventCard(_ card: Event) {
            guard let index = events.firstIndex(where: { $0.id == card.id}) else { return }
            events.remove(at: index)
        }
    }

//public class SwipeViewModel: ObservableObject {
//    
//    @Published var event: Event
//    @Published var information: [String]
//    @Published var state = EventState.loading
//    @Published var catalogs: [String] = []
//    
//    var title: String = ""
//    
//    init(event: Event, information: [String], title: String, state: EventState = EventState.loading, catalogs: [String]) {
//        self.event = event
//        self.information = information
//        self.title = title
//        self.state = state
//        self.catalogs = catalogs
//    }
//    
////    init(title: String) {
////        self.title = title
////        
////        if information.isEmpty {
////            information.insert(contentsOf: information)
////        }
////    }
//    
//    @ViewBuilder
//    private var View: some View {
//        Text("Event")
//        HStack(alignment: .center, spacing: 10) {
//            if catalogs.count > 0 {
//                Text("Event Items")
//            }
//        }
//    }
//    
//    func insert(username: String, color: Color) {
//        information.insert(contentsOf: information, at: 0)
//    }
//}
