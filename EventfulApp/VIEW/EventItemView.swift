//
//  EventItemView.swift
//  EventfulApp
//
//  Created by Lilli Cain on 11/6/24.
//

import SwiftUI

//struct EventItemView: View {
//    
//    @State private var event = Event.self
//    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 25) {
////            EventView(event: Event.MOCK_EVENT[0])
//        }
//        .padding()
//    }
//}

struct EventItemView: View {
    var event: Event
    @State var show: Bool
    

    var body: some View {
        VStack {
            if show {
                VStack(spacing: 20) {
                    // All the attributes
                    VStack {
                        
                        Text(event.name)
                            .font(.largeTitle)
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 10)
                        
                        Text("Time and Location: \(event.location) at \(event.startDate.formattedDate())")
                            .font(.body)
                            .multilineTextAlignment(.leading)
//                            .padding(.horizontal)
                        Text(event.description)
                            .font(.body)
                            .multilineTextAlignment(.leading)
//                            .padding(.horizontal)
                        Text("Minimum Age: " + event.ageRestriction)
                            .font(.body)
                            .multilineTextAlignment(.leading)
//                            .padding(.horizontal)
                        Text("Cost: " + event.cost + "$")
                            .font(.body)
                            .multilineTextAlignment(.leading)
//                            .padding(.horizontal)
                    }
                    .cornerRadius(10)
                    .background(Color.black.opacity(0.15))

                    Spacer()

                    // RSVP and swipe
                    HStack {
                        VStack {
                            Text("RSVPs")
                                .font(.headline)
                            Text("\(event.rsvp)")
                                .font(.title2)
                            Button(action: {
                                print("RSVP for \(event.name)")
                            }) {
                                Text("RSVP")
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.green)
                                    .cornerRadius(10)
                                    .foregroundColor(.white)
                            }
                        }
                        Spacer()
                        VStack {
                            Text("Swipes")
                                .font(.headline)
                            Text("\(event.swipeCount)")
                                .font(.title2)
                            Button(action: {
                                print("Swipe for \(event.name)")
                            }) {
                                Text("Swipe")
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.blue)
                                    .cornerRadius(10)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    
                    .padding()
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(12)
                    Button(action: {
                        withAnimation {
                            show.toggle()
                            
                        }
                    }) {
                        Text("Hide Info")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.black.opacity(0.8))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                    }
                }
                .foregroundStyle(.white)
                .padding()
            } else {
                // Main card view
                VStack {
                    Text(event.name)
                        .font(.title)
                        .lineLimit(2)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)

                    Text(event.description)
                        .lineLimit(3)
                        .multilineTextAlignment(.center)
                        .padding(.bottom)
                    Spacer()
                    Button(action: {
                        //  show info toggle
                        withAnimation {
                            show.toggle()
                        }
                        print("More Info button tapped")
                    }) {
                        Text("More Info")
                            .padding()  // Padding around text
                            .frame(maxWidth: .infinity, maxHeight: 50)  // Expand the button area
                            .background(Color.black.opacity(0.8))  // Set background color
                            .cornerRadius(10)  // Round the corners
                            .foregroundColor(.white)  // Set text color
                    }
                }
                .padding()
                .foregroundStyle(.white)
                .background(
                    LinearGradient(colors: [.black.opacity(0.7), .clear], startPoint: .bottom, endPoint: .top)
                )
                .cornerRadius(10)
            }
        }
    }
}

extension Date {
    func formattedDate(
        style: DateFormatter.Style = .medium,
        timeStyle: DateFormatter.Style = .short,
        timeZone: TimeZone = .current // Defaults to the phone's current time zone
    ) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = style
        formatter.timeStyle = timeStyle
        formatter.timeZone = timeZone
        return formatter.string(from: self)
    }
}

