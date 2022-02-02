//
//  CommentsView.swift
//  Instagram_CloneApp
//
//  Created by Ali Eren on 1.02.2022.
//

import SwiftUI

struct CommentsView: View {
    @State var comment = ""
    @ObservedObject var viewModel : CommentsViewModel
    
    init(post:Post){
        self.viewModel = CommentsViewModel(post: post)
    }
    
    var body: some View {
        VStack{
            ScrollView{
                LazyVStack(alignment:.leading,spacing:25){
                    ForEach(viewModel.comments){comment in
                        CommentsCellView(comment: comment)
                        
                    }
                }
            }
        }
        CommentInputView(inputText: $comment, action: uploadComment)
       
    }
    
    func uploadComment(){
        viewModel.uploadComment(comment: comment)
        self.comment = ""
    }
}
