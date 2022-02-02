//
//  PostGridView.swift
//  Instagram_CloneApp
//
//  Created by Ali Eren on 22.01.2022.
//

import SwiftUI
import Kingfisher
struct PostGridView: View {
    
    private let items = [GridItem(),GridItem(),GridItem()]
    private let width = UIScreen.main.bounds.width / 3
    let config :PostGridConfig
    @ObservedObject var viewModel : GridViewModel
    
    init(config:PostGridConfig){
        self.config = config
        self.viewModel = GridViewModel(config: config)
    }
    
    var body: some View {
        LazyVGrid(columns: items,spacing:2) {
            ForEach(viewModel.posts){post in
                KFImage(URL(string:post.imageURL))
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: width)
                    .clipped()
            }
        }
    }
}

