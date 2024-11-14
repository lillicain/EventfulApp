//
//  EventView.swift
//  EventfulApp
//
//  Created by Lilli Cain on 11/6/24.
//

import SwiftUI

struct CardView: View {
    var imageUrl: String
    var description: String
    
    @State private var offset = CGSize.zero

    var body: some View {
        ZStack {
            Image(imageUrl)
                .resizable()
                .scaledToFill()
                .frame(width: 500, height: 600)
                .clipped()
                .cornerRadius(10)
                .overlay(
                    VStack {
                        Spacer()
                        Text(description)
                            .font(.headline)
                            .padding()
                            .background(Color.black.opacity(0.5))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(10)
                    }
                )
        }
        .offset(x: offset.width, y: 0)
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    self.offset = gesture.translation
                }
                .onEnded { _ in
                    
                    if abs(self.offset.width) > 150 {
                     
                    } else {
                        self.offset = .zero
                    }
                }
        )
        .animation(.spring(), value: offset)
    }
}

//struct EventView: View {
//
//    @State private var selectedDate = Date()
//    
//    var dateWasMade: Date = Calendar.current.date(from: DateComponents(year: 2023)) ?? Date()
//    
//    var dateFormatter: DateFormatter {
//        let formatter = DateFormatter()
//        formatter.timeStyle = .medium
//        formatter.dateStyle = .medium
//        return formatter
//    }
//    
//    var event: Event
//    
//    var body: some View {
//        ScrollView {
//            VStack {
//                Text(event.event)
//                    .fontWeight(.semibold)
//                    .font(.title)
//                
//                Text("Photos: \(event.photos)")
//                    .padding()
//                
//                Text(dateFormatter.string(from: selectedDate))
//                Text("Date: \(event.date)")
//                
//                Divider()
//                
//                VStack {
//                    Text("Completed")
//                        .font(.headline)
//                    
//                    ScrollView {
//                        LazyVStack {
//                            ForEach(0..<20) { number in
//                                RoundedRectangle(cornerRadius: 25)
//                                    .stroke(Color.black, lineWidth: 5)
//                                    .clipShape(RoundedRectangle(cornerRadius: 25))
//                                    
//                                    .overlay(Text("\(number)").foregroundColor(.red))
//                                    .frame(width: 300, height: 150)
//                                    .padding()
//    
//                            }
//                        }
//                    }
//                }
//            }
//        }
//    }
//}

