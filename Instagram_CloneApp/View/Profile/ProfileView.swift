//
//  ProfileView.swift
//  Instagram_CloneApp
//
//  Created by Ali Eren on 22.01.2022.
//

import SwiftUI

struct ProfileView: View {
    let user : User
    var body: some View {
        ScrollView{
            VStack(spacing:32){
                ProfileHeaderView(viewModel: ProfileViewModel(user: user))
                    .padding()
                if let uid = user.id {
                    PostGridView(config: .profile(uid))
                        .padding(.horizontal,12)
                }
               
                
            }
            .padding(.top)
        }
        
    }
}

