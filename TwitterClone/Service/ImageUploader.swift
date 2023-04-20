//
//  ImageUploader.swift
//  TwitterClone
//
//  Created by İbrahim Aktaş on 20.04.2023.
//

import Firebase
import UIKit
import FirebaseStorage




struct ImageUploader {
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void){
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {return}
        
        let fileName = NSUUID().uuidString
        let ref =  Storage.storage().reference(withPath: "/profile_image/\(fileName)")
        
        ref.putData(imageData) { _ ,error in
            if let error = error {
                print("image not uploaded \(error.localizedDescription)")
                return
            }
            ref.downloadURL { imageUrl, _ in
                guard let imageUrl = imageUrl?.absoluteString else {return}
                completion(imageUrl)
            }
        }
    }
}
