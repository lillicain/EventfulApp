//
//  FeedCardView.swift
//  EventfulApp
//
//  Created by Lilli Cain on 1/15/25.
//

import Foundation
import SwiftUI

struct FeedCardView: View {
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
