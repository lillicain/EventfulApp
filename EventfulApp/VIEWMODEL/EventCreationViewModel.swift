//
//  EventCreationViewModel.swift
//  EventfulApp
//
//  Created by Lilli Cain on 12/9/24.
//

import Foundation
import SwiftUI

@Observable
class EventCreationViewModel {
    var name: String = ""
    var startDate: Date = Date()
    var endDate: Date = Date()
    var location: String = ""
    var description: String = ""
    var cost: String = ""
    var ageRestriction: String = "18+"
    var host: String = ""
    var rsvp: Int = 0
    var swipeCount: Int = 0
    var buttonDisabled: Bool = true
    
    let restrictions = ["Under 18", "18+", "21+"]

    var isNameFilled: Bool {
        return !name.isEmpty
    }
    
    var isLocationFilled: Bool {
        return !location.isEmpty
    }
    
    var isDescriptionFilled: Bool {
        return !description.isEmpty
    }
    
    var isCostFilled: Bool {
        return !cost.isEmpty
    }
    
    var isStartDateValid: Bool {
        return startDate >= Date()
    }
    
    var isEndDateValid: Bool {
        return endDate > startDate
    }
    
    var fieldsChanged: String {
        return "\(name)\(startDate)\(endDate)\(location)\(description)\(cost)\(ageRestriction)"
    }
    
    func validateFields() {
        buttonDisabled = name.isEmpty || location.isEmpty || description.isEmpty || cost.isEmpty || ageRestriction.isEmpty || !isStartDateValid || !isEndDateValid
    }
    
    func saveEvent() {
        let event = Event(
            name: name,
            startDate: startDate,
            endDate: endDate,
            location: location,
            description: description,
            cost: cost,
            ageRestriction: ageRestriction,
            rsvp: rsvp,
            swipeCount: swipeCount,
            host: host
        )
        
        Task {
            guard let id = await FirestoreEventManager.saveEvent(event: event) else {
                print("ERROR: Saving item from save button")
                return
            }
            print("event.id: \(id)")
        }
    }
    
    func resetForm() {
        name = ""
        startDate = Date()
        endDate = Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date()
        location = ""
        description = ""
        cost = ""
        ageRestriction = "18+"
        host = ""
        rsvp = 0
        swipeCount = 0
        buttonDisabled = true
    }
}
