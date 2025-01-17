//
//  EventView.swift
//  EventfulApp
//
//  Created by Lilli Cain on 11/6/24.
//

import SwiftUI

struct CardView: View {
    var viewModel: SwipeViewModel
    var event: Event
    var showInfo: Bool
    @State private var xOffset: CGFloat = 0
    @State private var degrees: Double = 0
    var body: some View {
        ZStack(alignment: .bottom) {
            // Background image, aka awesome
            Image("WonderfulParty")
                .resizable()
                .scaledToFill()
            // Text and button overlays
            EventItemView(event: event, show: showInfo)
                .frame(maxWidth: cardWidth)
                .padding(.horizontal)
        }
        .frame(maxWidth: cardWidth, maxHeight: cardHeight)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .offset(x: xOffset)
        .rotationEffect(.degrees(degrees))
        .animation(.snappy, value: xOffset)
        .gesture(
            DragGesture()
                .onChanged(onDragChanged)
                .onEnded(onDragEnded)
            
        )
        .shadow(radius: 10)
        
    }
}

private extension CardView {
    func returnToCenter() {
        xOffset = 0
        degrees = 0
    }
    func swipeRight() {
        withAnimation {
            xOffset = 500
            degrees = 12
        } completion: {
            viewModel.swipeRight(event)
            viewModel.removeEventCard(event)
        }
    }
    func swipeLeft() {
        withAnimation {
            xOffset = -500
            degrees = -12
        } completion: {
            viewModel.swipeLeft(event)
            viewModel.removeEventCard(event)
        }
    }
}

private extension CardView {
    func onDragChanged(_ value: _ChangedGesture<DragGesture>.Value) {
        xOffset = value.translation.width
        degrees = Double(value.translation.width / 25)
    }
    func onDragEnded(_ value: _ChangedGesture<DragGesture>.Value) {
        let width = value.translation.width
        
        if abs(width) <= abs(screenCutOff) {
            returnToCenter()
            return
        }
        if width >= screenCutOff {
            swipeRight()
        } else {
            swipeLeft()
        }
    }
}

private extension CardView {
    var cardWidth: CGFloat {
        UIScreen.main.bounds.width - 20
    }
    var cardHeight: CGFloat {
        UIScreen.main.bounds.height / 1.45
    }
    // animation screen cut off for snapping back
    var screenCutOff: CGFloat {
        (UIScreen.main.bounds.width / 2) * 0.8
    }
}

#Preview {
    CardView(viewModel: SwipeViewModel(fireStoreManager: FirestoreEventManager()),
             event: Event(
                id: "1",
                name: "Sample Event",
                startDate: Date(),
                endDate: Date(),
                location: "Central Park",
                description: "This is a sample event description.",
                cost: "$50",
                ageRestriction: "18+",
                rsvp: 100,
                swipeCount: 50,
                host: "John Doe"
             ), showInfo: false)
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

