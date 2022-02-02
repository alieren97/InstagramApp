//
//  User.swift
//  Instagram_CloneApp
//
//  Created by Ali Eren on 24.01.2022.
//

import Firebase
import FirebaseFirestoreSwift

struct User : Decodable,Identifiable {
    let username : String
    let email : String
    let fullname : String
    var profileImageURL : String?
    @DocumentID var id: String?
    var stats : UserStatss?
    var isCurrentUser : Bool {
        return AuthViewModel.shared.userSession?.uid == id
    }
    
    var didFollow :Bool? = false
    
}



struct UserStatss : Decodable {
    var following :Int
    var follower :Int
    var posts :Int
}
