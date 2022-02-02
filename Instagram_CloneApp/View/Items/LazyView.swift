//
//  LazyView.swift
//  Instagram_CloneApp
//
//  Created by Ali Eren on 2.02.2022.
//

import SwiftUI

struct LazyView<Content:View>: View {
    
    let build: () -> Content
    
    init(_ build: @autoclosure @escaping() -> Content) {
        self.build = build
    }
    
    var body : Content { build() }
}
