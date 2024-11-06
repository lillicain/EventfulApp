//
//  Event.swift
//  EventfulApp
//
//  Created by Lilli Cain on 11/6/24.
//

import Foundation

struct Event {
    var id: String
    var event: String
    var notifications = true
    var photos = ""
    var date = Date()
}

extension Event {
    static var MOCK_EVENT: [Event] = [
        .init(id: NSUUID().uuidString, event: "event")
    ]
}
