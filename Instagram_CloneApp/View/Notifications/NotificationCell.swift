//
//  NotificationCell.swift
//  Instagram_CloneApp
//
//  Created by Ali Eren on 22.01.2022.
//

import SwiftUI
import Kingfisher

struct NotificationCell: View {
    
    @ObservedObject var viewModel: NotificationCellViewModel
    var didFollow:Bool{
        return viewModel.notification.didFollow ?? false
    }
    init(viewModel:NotificationCellViewModel){
        self.viewModel = viewModel
    }
    var body: some View {
        HStack{
            if let user = viewModel.notification.user {
                NavigationLink {
                    ProfileView(user:user)
                } label: {
                    if let imageURL = viewModel.notification.profileImageURL{
                         
                        KFImage(URL(string:imageURL))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                    }
                
                    
                    Text(viewModel.notification.username)
                        .font(.system(size:14,weight: .semibold))
                    +
                    Text(viewModel.notification.type.notificationMessage)
                        .font(.system(size:15))
                    +
                    Text(" \(viewModel.timestamp)")
                        .foregroundColor(.gray)
                        .font(.system(size:12))
                }

            }
            
            Spacer()
            
            if viewModel.notification.type == .follow {
                Button(action:{
                    didFollow ? viewModel.unfollow() :viewModel.follow()
                    
                },label:{
                    Text(didFollow ? "Following" : "Follow Back")
                        .font(.system(size:14,weight: .semibold))
                        .frame(width: 172, height: 32)
                        .foregroundColor(didFollow ? .black :.white )
                        .background(didFollow ? Color.white :Color.blue)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray,lineWidth: didFollow ? 1 :0)
                        )
                })

                
            }
            else {
                if let post = viewModel.notification.post {
                    NavigationLink(destination: ScrollView{
                        FeedCell(viewModel: FeedCellViewModel(post:post))
                    }){
                        KFImage(URL(string:post.imageURL))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .clipped()
                    }
                    
                }
                
            }
            
       
            
            
            

            
            

        }
        .padding(.horizontal)
    }
}

