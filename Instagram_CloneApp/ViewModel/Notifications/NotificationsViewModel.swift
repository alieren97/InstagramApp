//
//  NotificationsViewModel.swift
//  Instagram_CloneApp
//
//  Created by Ali Eren on 29.01.2022.
//

import SwiftUI
import Firebase

class NotificationsViewModel :ObservableObject {
    @Published var notifications = [Notification]()
    
    init() {
        fetchNotifications()
    }
    
    func fetchNotifications(){
        guard let userId = AuthViewModel.shared.userSession?.uid else { return }
        
        Firestore.firestore().collection("notifications").document(userId).collection("user-notifications").order(by: "timestamp", descending: true).getDocuments { (snap, err) in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            
            guard let documents = snap?.documents else { return }
            self.notifications = documents.compactMap({ try? $0.data(as: Notification.self)})
        }
    }
    static func sendNotification(withUid uid:String,type:NotificationType,post:Post? = nil){
        guard let user = AuthViewModel.shared.currentUser else {return}
        guard let userId = user.id else {return}
        var data :[String:Any] = ["timestamp":Timestamp(date:Date()),
                                  "username":user.username,
                                  "uid":userId,
                                  "profileImageURL":user.profileImageURL, 
                                  "type":type.rawValue]
        
        if let post = post, let id = post.id {
            data["postId"]=id
        }
        Firestore.firestore().collection("notifications").document(uid).collection("user-notifications").addDocument(data: data) { err in
            if let err = err{
                print(err.localizedDescription)
                return
        }
        }
    }
}

