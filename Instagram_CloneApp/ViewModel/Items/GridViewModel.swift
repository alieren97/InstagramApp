//
//  GridViewModel.swift
//  Instagram_CloneApp
//
//  Created by Ali Eren on 27.01.2022.
//

import SwiftUI
import Firebase

enum PostGridConfig{
    case explore
    case profile(String)
    
}

class GridViewModel: ObservableObject{
    @Published var posts = [Post]()
    let config : PostGridConfig
    
    init(config:PostGridConfig){
        self.config = config
        fetchPosts()
    }
    
    func fetchPosts(){
        switch config {
        case .explore:
            fetchPostsExplorePage()
        case .profile(let userID):
            fetchPostsProfilePage(withUid:userID)
        
            
        }
    }
    
    func fetchPostsProfilePage(withUid userID:String){
        Firestore.firestore().collection("posts").whereField("ownerUid",isEqualTo: userID).getDocuments { snap, err in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            
            guard let documents = snap?.documents else {return}
            self.posts = documents.compactMap({ try? $0.data(as:Post.self)        })
        }
    }
    func fetchPostsExplorePage(){
        Firestore.firestore().collection("posts").getDocuments { snap, err in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            
            guard let documents = snap?.documents else {return}
            self.posts = documents.compactMap({ try? $0.data(as:Post.self)        })
        }
    }
}
