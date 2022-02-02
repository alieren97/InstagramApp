//
//  MessageBubble.swift
//  Instagram_CloneApp
//
//  Created by Ali Eren on 3.02.2022.
//

import SwiftUI

struct MessageBubbleView: Shape {
    
    var ownAccount: Bool
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight, ownAccount ? .bottomLeft : .bottomRight], cornerRadii: CGSize(width: 15, height: 15))
        
        return Path(path.cgPath)
    }
    
}
