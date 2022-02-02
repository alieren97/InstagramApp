//
//  UserService.swift
//  Instagram_CloneApp
//
//  Created by Ali Eren on 28.01.2022.
//

import SwiftUI
import Firebase


struct UserService {
    static func follow(uid :String,completion:((Error?)->Void)?){
        guard let currentUid = AuthViewModel.shared.userSession?.uid else {return}
        
        Firestore.firestore().collection("following").document(currentUid).collection("user-following")
            .document(uid).setData([:]) { err in
                if let err = err {
                    print(err.localizedDescription)
                    return
                }
                
                Firestore.firestore().collection("followers").document(uid).collection("user-followers").document(currentUid).setData([:], completion: completion)
            }
    }
    
    static func unfollow(uid :String,completion:((Error?)->Void)?){
        guard let currentUid = AuthViewModel.shared.userSession?.uid else {return}
        
        Firestore.firestore().collection("following").document(currentUid).collection("user-following")
            .document(uid).delete { err in
                if let err = err {
                    print(err.localizedDescription)
                    return
                }
                Firestore.firestore().collection("followers").document(uid).collection("user-followers").document(currentUid).delete(completion: completion)
            }
    }
    
    static func checkFollow(userId : String,completion:@escaping(Bool)->Void){
        
        guard let currentUid = AuthViewModel.shared.userSession?.uid else {return}
        
        Firestore.firestore().collection("following").document(currentUid).collection("user-following").document(userId).getDocument { snap, err in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            guard let didFollow = snap?.exists else {return}
            
            completion(didFollow)
            
        }
    }
}
