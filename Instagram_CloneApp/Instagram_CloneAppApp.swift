//
//  Instagram_CloneAppApp.swift
//  Instagram_CloneApp
//
//  Created by Ali Eren on 22.01.2022.
//

import SwiftUI
import Firebase

@main
struct Instagram_CloneAppApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            
           ContentView().environmentObject(AuthViewModel.shared)
        }
    }
}
