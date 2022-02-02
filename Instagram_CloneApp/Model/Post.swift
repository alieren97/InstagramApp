//
//  Post.swift
//  Instagram_CloneApp
//
//  Created by Ali Eren on 26.01.2022.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct Post : Decodable,Identifiable{
    @DocumentID var id: String?
    let ownerUid: String
    let ownerUsername: String
    let caption: String
    var likes: Int
    let imageURL: String
    let timestamp: Timestamp
    var ownerImageURL: String?
    
    var user :User?
    var didLike :Bool? = false
  
}
