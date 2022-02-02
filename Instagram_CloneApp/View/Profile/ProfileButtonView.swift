//
//  ProfileButtonView.swift
//  Instagram_CloneApp
//
//  Created by Ali Eren on 25.01.2022.
//

import SwiftUI

struct ProfileButtonView: View {
    @ObservedObject var viewModel:ProfileViewModel
    var didFollow:Bool{
        return viewModel.user.didFollow ?? false
    }
    var body: some View {
        if viewModel.user.isCurrentUser{
            Button(action:{
                
            },label:{
                Text("Edit Profile")
                    .font(.system(size:14,weight: .semibold))
                    .frame(width: 360, height: 50)
                    .foregroundColor(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(Color.gray,lineWidth: 1)
                    )
            })
        }
        else{
            HStack(spacing:16){
                Button(action:{
                    didFollow ? viewModel.unfollow() :viewModel.follow()
                    
                },label:{
                    Text(didFollow ? "Following" : "Follow")
                        .font(.system(size:14,weight: .semibold))
                        .frame(width: 172, height: 32)
                        .foregroundColor(didFollow ? .black :.white )
                        .background(didFollow ? Color.white :Color.blue)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray,lineWidth: didFollow ? 1 :0)
                        )
                })
                if let userId = viewModel.user.id {
                    NavigationLink(destination:MessageChatView(userID:userId)){
                        Text("Message")
                            .font(.system(size:14,weight: .semibold))
                            .frame(width: 172, height: 32)
                            .foregroundColor(.black)
                            .overlay(
                                RoundedRectangle(cornerRadius: 3)
                                    .stroke(Color.gray,lineWidth: 1)
                            )
                    }
                  
                }
              
            }
        }
    }
}


