//
//  RegisterView.swift
//  Instagram_CloneApp
//
//  Created by Ali Eren on 22.01.2022.
//

import SwiftUI

struct RegisterView: View {
    @State var email = ""
    @State var username = ""
    @State var fullname = ""
    @State var password = ""
    
    
    @EnvironmentObject var viewModel : AuthViewModel
    var body: some View {
        NavigationView{
            VStack{
                Image("instagram-text-logo")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220, height: 220)
                    .foregroundColor(.black)
                
                VStack(spacing:-16) {
                    CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope",secure:false)
                        .padding()
                        .cornerRadius(10)
                        .foregroundColor(.gray)
                    .padding(.horizontal,32)
                    
                    CustomTextField(text: $username, placeholder: Text("Username"), imageName: "person",secure:false)
                        .padding()
                        .cornerRadius(10)
                        .foregroundColor(.gray)
                    .padding(.horizontal,32)
                    
                    CustomTextField(text: $fullname, placeholder: Text("FullName"), imageName: "person",secure:false)
                        .padding()
                        .cornerRadius(10)
                        .foregroundColor(.gray)
                    .padding(.horizontal,32)
                    
                    CustomTextField(text: $password, placeholder: Text("Password"), imageName: "lock",secure:true)
                        .padding()
                        .cornerRadius(10)
                        .foregroundColor(.gray)
                        .padding(.horizontal,32)
                    
                    HStack{
                        Spacer()
                        Text("Forgot Password?")
                            .font(.system(size:13,weight: .semibold))
                            .foregroundColor(.gray)
                            .padding(.top)
                            .padding(.trailing,28)
                    }
                }
              
                
                Button {
                    viewModel.register(withEmail: email, password: password,username:username,fullname: fullname)
                } label: {
                    Text("Register")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 50)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .padding()
                }

                Spacer()
                
                
                NavigationLink(destination:SigninView().navigationBarHidden(true),
                               
                               label:{
                    HStack{
                        Text("You have an account").font(.system(size:14,weight:.semibold))
                        Text("Sign In").font(.system(size:14))
                    }
                    
                })
               
            }.padding(.top,-110)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
