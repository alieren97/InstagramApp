//
//  ProfileHeaderVIew.swift
//  Instagram_Clone
//
//  Created by Eren Cem Salta on 4/21/21.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {

    @State var selectedImage: UIImage?
    @State var userImage: Image? = Image("profile-placeholder")
    @State var imagePickerRepresented = false
    @ObservedObject var viewModel: ProfileViewModel
   
    var body: some View {
        VStack(alignment: .leading) {

                HStack {
                    
                    ZStack {
                        if let imageURL = viewModel.user.profileImageURL {
                            Button {
                                self.imagePickerRepresented.toggle()
                            } label: {
                                KFImage(URL(string: imageURL))
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 80, height: 80)
                                    .clipShape(Circle())
                                    .padding(.leading, 16)
                            }.sheet(isPresented: $imagePickerRepresented, onDismiss: loadImage, content: {
                                ImagePicker(image: $selectedImage)
                            })

                        }
                        else {
                            Button {
                                self.imagePickerRepresented.toggle()
                            } label: {
                                userImage?
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 80, height: 80)
                                    .clipShape(Circle())
                                    .padding(.leading, 16)
                            }.sheet(isPresented: $imagePickerRepresented, onDismiss: loadImage, content: {
                                ImagePicker(image: $selectedImage)
                            })

                        }
                    }
                    
                    Spacer()
                    
                    HStack(spacing:16){
                        UserStats(value: 100, title: "Posts")
                        UserStats(value: 100, title: "Following")
                        UserStats(value: 100, title: "Follower")
                        
                    }
                    .padding(.trailing,32)
                    
                }
            Text(viewModel.user.fullName ?? "")
                .font(.system(size:15,weight: .bold))
                .padding([.leading,.top])
            
        }
        
    }
}

extension ProfileHeaderView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        userImage = Image(uiImage: selectedImage)
        viewModel.changeProfileImage(image: selectedImage) { (_) in
            print("DEBUG: Uploaded Image")
        }
    }
}



