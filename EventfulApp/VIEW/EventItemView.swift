//
//  EventItemView.swift
//  EventfulApp
//
//  Created by Lilli Cain on 11/6/24.
//

import SwiftUI

struct EventItemView: View {
    
    @State private var event = Event.self
    
    var body: some View {
        VStack(alignment: .leading, spacing: 25) {
            EventView(event: Event.MOCK_EVENT[0])
        }
        .padding()
    }
}
