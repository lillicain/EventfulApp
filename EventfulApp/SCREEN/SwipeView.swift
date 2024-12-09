//
//  SwipeScreen.swift
//  EventfulApp
//
//  Created by Lilli Cain on 11/6/24.
//

import SwiftUI
import FirebaseFirestore

struct SwipeView: View {
    
    @State var viewModel: SwipeViewModel
    @State private var show = false

    init(manager: FirestoreEventManager) {
        _viewModel = State(wrappedValue: SwipeViewModel(fireStoreManager: manager))
    }
    
    var body: some View {
        ZStack {
            CardStackView(viewModel: viewModel)
            VStack {
                HStack {
                    Spacer()
                    
                    Button {
                        show.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                Spacer()
            }
            .padding()
        }
        .fullScreenCover(isPresented: $show, content: {
            EventCreationView()
        })
    }
}

#Preview {
    let manager = FirestoreEventManager()
    SwipeView(manager: manager)
}

