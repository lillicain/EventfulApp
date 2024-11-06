//
//  EventView.swift
//  EventfulApp
//
//  Created by Lilli Cain on 11/6/24.
//

import SwiftUI

struct EventView: View {
    
    @State private var selectedDate = Date()
    
    var dateWasMade: Date = Calendar.current.date(from: DateComponents(year: 2023)) ?? Date()
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .medium
        return formatter
    }
    
    var event: Event
    
    var body: some View {
        ScrollView {
            VStack {
                Text(event.event)
                    .fontWeight(.semibold)
                    .font(.title)
                
                Text("Photos: \(event.photos)")
                    .padding()
                
                Text(dateFormatter.string(from: selectedDate))
                Text("Date: \(event.date)")
                
                Divider()
                
                VStack {
                    Text("Completed")
                        .font(.headline)
                    
                    ScrollView {
                        LazyVStack {
                            ForEach(0..<20) { number in
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.black, lineWidth: 5)
                                    .clipShape(RoundedRectangle(cornerRadius: 25))
                                    
                                    .overlay(Text("\(number)").foregroundColor(.red))
                                    .frame(width: 300, height: 150)
                                    .padding()
    
                            }
                        }
                    }
                }
            }
        }
    }
}

