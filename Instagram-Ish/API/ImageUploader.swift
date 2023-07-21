//
//  ImageUploader.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/20/23.
//

import UIKit
import Firebase
import FirebaseStorage

struct ImageUploader {
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        let fileName = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(fileName)")
        
        ref.putData(imageData) { _, error in
            if let error = error {
                print("DEBUG: Failed to upload image - \(error.localizedDescription)")
            }
            
            print("successfully uploaded image")
            
            ref.downloadURL { url, _ in
                guard let imageURL = url?.absoluteString else { return }
                
                completion(imageURL)
            }
        }
    }
}
