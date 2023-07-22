//
//  ImageUploader.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/20/23.
//

import UIKit
import FirebaseStorage

enum ImageUploadType{
    case profileImage
    case postImage
    
    var filePath: StorageReference {
        let fileName = NSUUID().uuidString
        
        switch self {
        case .profileImage:
            return STORAGE.reference(withPath: "/profile_images/\(fileName)")
        case .postImage:
            return STORAGE.reference(withPath: "/post_images/\(fileName)")
        }
    }
}

struct ImageUploader {
    static func uploadImage(image: UIImage, type: ImageUploadType, completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        
        let ref = type.filePath
        
        ref.putData(imageData) { _, error in
            if let error = error {
                print("DEBUG: Failed to upload image - \(error.localizedDescription)")
            }
            
            ref.downloadURL { url, _ in
                guard let imageURL = url?.absoluteString else { return }
                
                completion(imageURL)
            }
        }
    }
}
