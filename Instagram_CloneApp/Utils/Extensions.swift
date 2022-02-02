//
//  Extensions.swift
//  Instagram_CloneApp
//
//  Created by Ali Eren on 22.01.2022.
//

import UIKit

extension UIApplication{
    func endEditing(){
        sendAction(#selector(UIResponder.resignFirstResponder),to:nil,from:nil,for:nil)
    }
}
