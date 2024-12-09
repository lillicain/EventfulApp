//
//  Event.swift
//  EventfulApp
//
//  Created by Lilli Cain on 11/6/24.
//

import Foundation
import FirebaseFirestore

struct Event: Codable, Identifiable {
    @DocumentID var id: String?
    var name: String
    var startDate: Date
    var endDate: Date
    var location: String
    var description: String
    var cost: String
    var ageRestriction: String
    var rsvp: Int
    var swipeCount: Int
    var host: String
}

//struct Event {
//    var id: String
//    var event: String
//    var notifications = true
//    var photos = ""
//    var date = Date()
//}

extension Event {
//    static var MOCK_EVENT: [Event] = [
//        .init(id: NSUUID().uuidString, event: "event")
//    ]
}
