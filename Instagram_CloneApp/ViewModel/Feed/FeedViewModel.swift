//
//  FeedViewModel.swift
//  Instagram_CloneApp
//
//  Created by Ali Eren on 26.01.2022.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

class FeedViewModel : ObservableObject {
    @Published var posts = [Post]()
    
    init(){
        fetchPosts()
    }
    
    func fetchPosts() {
        Firestore.firestore().collection("posts").getDocuments { (snap, err) in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            
            guard let documents = snap?.documents else { return }
            
            self.posts = documents.compactMap({ try? $0.data(as: Post.self)})
            print(self.posts)
            
        }
    }
}
