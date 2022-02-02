//
//  SearchViewModel.swift
//  Instagram_CloneApp
//
//  Created by Ali Eren on 27.01.2022.
//

import SwiftUI
import Firebase

class SearchViewModel :ObservableObject{
    
    @Published var users = [User]()
    
    init(){
        fecthUsers()
    }
    
    func fecthUsers(){
        Firestore.firestore().collection("users").getDocuments { snap, err in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            guard let document = snap?.documents else {return}
            self.users = document.compactMap({try? $0.data(as: User.self)})
            print(self.users)
        }
    }
    
    
    func filterUsers(withText input: String) -> [User]{
        let lowercasedInput = input.lowercased()
        return users.filter({$0.fullname.lowercased().contains(lowercasedInput) || $0.username.lowercased().contains(lowercasedInput)})
        
    }
}
