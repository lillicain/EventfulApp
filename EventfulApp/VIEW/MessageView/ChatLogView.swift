//
//  ChatLogView.swift
//  EventfulApp
//
//  Created by Lilli Cain on 12/9/24.
//

import Foundation
import SwiftUI

struct ChatLogView: View {
    let chatProfile: DBProfile?
    
    @State var chatText = ""
    @ObservedObject var vm: ChatLogViewModel
    
    init(chatProfile: DBProfile?) {
        self.chatProfile = chatProfile
        self.vm = .init(dbProfile: chatProfile)
    }
    
    var body: some View {
        ZStack {
            messagesView
            Text(vm.errorMessage)
            VStack {
                Spacer()
                chatBottomBar
                    .background(Color.white)
            }
        }
        .clipped()
        .navigationTitle(chatProfile?.email ?? "")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: VIEWS

extension ChatLogView {
    var chatBottomBar: some View {
        HStack(spacing: 16) {
            Image(systemName: "photo.on.rectangle")
                .font(.system(size: 24))
                .foregroundColor(Color(.darkGray))
            
            TextField("Text Message", text: $vm.chatText)
                .padding(.all, 6)
                .background(Color(.init(white: 0.95, alpha: 1)))
                .cornerRadius(4)
            
            Button {
                vm.handleSend()
            } label: {
                Text("Send")
                    .foregroundColor(.white)
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
            .background(Color.blue)
            .cornerRadius(5)
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
    }
    
    var messagesView: some View {
        ScrollView {
            ScrollViewReader { scrollViewProxy in
                VStack {
                    ForEach(vm.chatMessages) { message in
                        MessageView(message: message)
                    }
                    HStack { Spacer() }
                        .id("Empty")
                }
                .onReceive(vm.$count) { _ in
                    withAnimation(.easeOut(duration: 0.5)) {
                        scrollViewProxy.scrollTo("Empty", anchor: .bottom)
                    }
                }
            }
        }
        .clipped()
        .background(Color(.init(white: 0.95, alpha: 1)))
        .padding(.bottom, 65)
    }
}

