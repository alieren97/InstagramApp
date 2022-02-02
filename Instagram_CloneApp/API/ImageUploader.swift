//
//  ImageUploader.swift
//  Instagram_CloneApp
//
//  Created by Ali Eren on 25.01.2022.
//

import SwiftUI
import Firebase

enum UploadType{
    case profile
    case post
    
    var filePath :StorageReference{
        let filename = NSUUID().uuidString
        switch self{
        case .profile:
            return Storage.storage().reference(withPath:"/profile_images/\(filename)")
        case .post:
            return Storage.storage().reference(withPath:"/post_images/\(filename)")
       
    
        }

    }
}

struct ImageUploader{
    static func uploadImage(image:UIImage,type:UploadType,completion:@escaping(String)->Void){
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {return}
        let ref = type.filePath
        ref.putData(imageData, metadata: nil) { _, err in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            
            
            ref.downloadURL { url, err in
                if let err = err {
                    print(err.localizedDescription)
                    return
                }
                guard let imageURL = url?.absoluteString else {return}
                completion(imageURL)
            }
        }
    }
}
