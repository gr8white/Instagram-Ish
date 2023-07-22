//
//  UploadPostViewModel.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/22/23.
//

import Foundation
import SwiftUI
import Firebase

class UploadPostViewModel: ObservableObject {
    func uploadPost(caption: String, image: UIImage, completion: @escaping FirestoreErrorCompletion) {
        guard let user = AuthenticationViewModel.shared.currentUser, let userID = user.id else { return }
        
        ImageUploader.uploadImage(image: image, type: .postImage) { imageURL in
            let post = Post(
                caption: caption,
                timeStamp: Timestamp(date: Date()),
                likes: 0,
                imageURL: imageURL,
                ownerUid: userID,
                ownerProfileImageURL: user.profileImageURL,
                ownerUserName: user.userName
            )
            
            Task {
                let encodedPost = try Firestore.Encoder().encode(post)
                
                FIRESTORE_POSTS.addDocument(data: encodedPost, completion: completion)
            }
        }
    }
}
