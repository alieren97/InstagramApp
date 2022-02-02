//
//  SigninView.swift
//  Instagram_CloneApp
//
//  Created by Ali Eren on 22.01.2022.
//

import SwiftUI

struct SigninView: View {
    @EnvironmentObject var viewModel : AuthViewModel
    @State var email = ""
    @State var password = ""
    
    
    
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
                    
                    CustomTextField(text: $password, placeholder: Text("Password"), imageName: "lock",secure:true)
                        .padding()
                        .cornerRadius(10)
                        .foregroundColor(.gray)
                        .padding(.horizontal,32)
                    
                    HStack{
                        Spacer()
                        NavigationLink {
                            ForgotPassword(email: $email)
                                .navigationBarHidden(true)
                        } label: {
                            Text("Forgot Password?")
                                .font(.system(size:13,weight: .semibold))
                                .foregroundColor(.gray)
                                .padding(.top)
                                .padding(.trailing,28)
                        }

                        
                    }
                }
              
                
                Button {
                    viewModel.login(withEmail: email, password: password)
                } label: {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 50)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .padding()
                }

                Spacer()
                
                
                NavigationLink(destination:RegisterView().navigationBarHidden(true),
                               
                               label:{
                    HStack{
                        Text("Dont have an account").font(.system(size:14,weight:.semibold))
                        Text("Sign Up").font(.system(size:14))
                    }
                    
                })
               
            }
            .padding(.top,-110)
        }
    }
}

struct SigninView_Previews: PreviewProvider {
    static var previews: some View {
        SigninView()
    }
}
