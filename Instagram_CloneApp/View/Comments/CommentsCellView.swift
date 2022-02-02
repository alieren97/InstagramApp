//
//  CommentsCellView.swift
//  Instagram_CloneApp
//
//  Created by Ali Eren on 1.02.2022.
//

import SwiftUI
import Kingfisher

struct CommentsCellView: View {
    let comment: Comment
    var body: some View {
        HStack{
            KFImage(URL(string: comment.profileImageURL))
                .resizable()
                .scaledToFill()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
            
            HStack{
                Text(comment.username)
                    .font(.system(size:14,weight:.semibold))
                +
                Text(" \(comment.comment)")
                    .font(.system(size:14))
                Spacer()
                
                Text(comment.timestampText ?? "")
                    .foregroundColor(.gray)
                    .font(.system(size:12))
                    .padding(.trailing)
            }
        }
        .padding(.horizontal)
    }
}


