//
//  MessageChatView.swift
//  Instagram_CloneApp
//
//  Created by Ali Eren on 2.02.2022.
//

import SwiftUI

struct MessageChatView: View {
    @ObservedObject var viewModel : MessageViewModel
    @State var message = ""
    @State var scrolled = false
    init(userID: String){
        
        self.viewModel = MessageViewModel(userId:userID)
        
    }
    var body: some View {
        VStack{
            ScrollViewReader{reader in
                ScrollView{
                    LazyVStack{
                        ForEach(viewModel.messages){message in
                            MessageRowView(message: message)
                                .onAppear{
                                    if message.id == viewModel.messages.last?.id && !scrolled{
                                        reader.scrollTo(viewModel.messages.last?.id, anchor: .bottom)
                                        scrolled = true
                                    }
                                }
                        }
                        .onChange(of: viewModel.messages) { _ in
                            reader.scrollTo(viewModel.messages.last?.id, anchor: .bottom)
                            
                        }
                    }
                }
            }
            
            MessageInputView(message: $message, action: sendMessage)
                
        }
    }
    
    func sendMessage(){
        viewModel.sendMessage(message: message)
        message=""
    }
}

