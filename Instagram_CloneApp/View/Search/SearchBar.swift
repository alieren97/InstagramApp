//
//  SearchBar.swift
//  Instagram_CloneApp
//
//  Created by Ali Eren on 22.01.2022.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text : String
    @Binding var isEditing :Bool
    var body: some View {
        HStack {
            TextField("Search...",text:$text)
                .padding(8)
                .padding(.horizontal,24)
                .background(Color(.systemGray6))
                .cornerRadius(6)
                .overlay(
                    HStack{
                        Image(systemName: "magnifiyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth:0,maxWidth: .infinity,alignment: .leading)
                })
            Button {
                isEditing = false
                text = ""
                UIApplication.shared.endEditing()
            } label: {
                Text("Cancel")
                    .foregroundColor(.black)
            }
            .padding(.trailing,8)
            .transition(.move(edge:.trailing))
            .animation(.default)

        }.onTapGesture {
            isEditing = true
        }
    }
}
