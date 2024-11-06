//
//  SwipeScreen.swift
//  EventfulApp
//
//  Created by Lilli Cain on 11/6/24.
//

import SwiftUI

struct SwipeScreen: View {
    
    @State private var show = false
    
    @ObservedObject var data: SwipeViewModel
    
    var body: some View {
        NavigationView {
            List {
               RoundedRectangle(cornerRadius: 10)
                    .frame(width: 300, height: 200)
                    .foregroundColor(Color.gray.opacity(0.3))
                    .scaledToFit()
                    
                
                
                Button {
                    show.toggle()
                } label: {
                    Text("User Profile")
                }
                
            }
        }
    }
}
