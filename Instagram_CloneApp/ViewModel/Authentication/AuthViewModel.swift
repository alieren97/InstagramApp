//
//  AuthViewModel.swift
//  Instagram_CloneApp
//
//  Created by Ali Eren on 23.01.2022.
//

import SwiftUI
import Firebase


class AuthViewModel: ObservableObject {
    
    @Published var userSession: Firebase.User?
    @Published var currentUser: User?
    
    static let shared = AuthViewModel()
    
    init() {
        userSession = Auth.auth().currentUser        
        fetchUser()
    }
    
    func login(withEmail email: String, password: String) {
        
        print(email)
        print(password)
        Auth.auth().signIn(withEmail: email, password: password) { (result, err) in
            if let err = err {
                print(err)
                
                return
            }
            
            guard let user = result?.user else { return }
            
            self.userSession = user
            self.fetchUser()
            
            
        }
    }
    
    func register(withEmail email: String, password: String, username: String, fullname: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            
            guard let user = result?.user else { return }
            
            let data = ["email": email,
                        "username": username,
                        "fullname": fullname,
                        "uid": user.uid]
            
            Firestore.firestore().collection("users").document(user.uid).setData(data) { err in
                if let err = err {
                    print(err.localizedDescription)
                    return
                }
                
                self.userSession = user
                self.fetchUser()
                
                print("DEBUG: USER CREATED")
            }
            
        }
    }
    
    func logout() {
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
    func fetchUser() {
        
        
        guard let uid = userSession?.uid else { return }
        print(uid)
        Firestore.firestore().collection("users").document(uid).getDocument { (snap, err) in
            if let err = err {
                
                print(err.localizedDescription)
                return
            }
            
            
            guard let user = try? snap?.data(as: User.self) else { return }
            
            self.currentUser = user
            
        }
    }
    
}
