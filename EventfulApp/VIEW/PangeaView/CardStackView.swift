//
//  CardStackView.swift
//  EventfulApp
//
//  Created by Lilli Cain on 12/9/24.
//

import SwiftUI

struct CardStackView: View {
    
    var viewModel: SwipeViewModel
    var show: Bool = false
    
    var body: some View {
        ZStack {
            ForEach(viewModel.events) { event in
                CardView(viewModel: viewModel, event: event, showInfo: show)
            }
            if (viewModel.events.isEmpty) {
                Text("All gone!")
            }
        }
    }
}

#Preview {
    CardStackView(viewModel: SwipeViewModel(fireStoreManager: FirestoreEventManager()))
}
