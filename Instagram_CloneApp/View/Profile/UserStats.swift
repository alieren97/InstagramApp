//
//  UserStats.swift
//  Instagram_CloneApp
//
//  Created by Ali Eren on 22.01.2022.
//

import SwiftUI

struct UserStats: View {
    let value :Int
    let title : String
    var body: some View {
        VStack{
            Text("\(value)")
                .font(.system(size:15,weight: .semibold))
            Text(title)
                .font(.system(size:15))
        }
        .frame(width: 80, alignment: .center)
    }
}

