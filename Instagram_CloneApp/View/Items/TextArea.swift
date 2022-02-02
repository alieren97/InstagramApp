//
//  TextArea.swift
//  Instagram_CloneApp
//
//  Created by Ali Eren on 22.01.2022.
//

import SwiftUI

struct TextArea: View {
    @Binding var text :String
    let placeholder : String
    
    init(text:Binding<String>,placeholder:String){
        self._text = text
        self.placeholder = placeholder
        UITextView.appearance().backgroundColor = .clear
    }
    var body: some View {
        ZStack(alignment:.topLeading){
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(Color(UIColor.placeholderText))
                    .padding(.horizontal,8)
                    .padding(.vertical,12)
            }
            TextEditor(text:$text)
                    .padding(4)
               
            
    }
        .font(.body)
}

}
