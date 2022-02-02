//
//  Notification.swift
//  Instagram_CloneApp
//
//  Created by Ali Eren on 29.01.2022.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct Notification :Decodable,Identifiable {
    @DocumentID var id : String?
    var postId : String?
    var username :String
    var profileImageURL :String?
    var timestamp : Timestamp
    var uid : String
    var type:NotificationType
    var didFollow :Bool? = false
    
    var post: Post?
    var user :User?
}
    

enum NotificationType : Int,Decodable{
    case follow
    case comment
    case like
    
    var notificationMessage :String {
        switch self {
        case .like:
            return " liked one of your posts."
        case .comment:
            return " commented on one of your posts."
        case .follow:
            return " started following you"
        }
    }
}
