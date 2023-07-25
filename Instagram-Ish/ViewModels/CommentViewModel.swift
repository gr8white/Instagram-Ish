//
//  CommentViewModel.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/25/23.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseFirestoreSwift

class CommentViewModel: ObservableObject {
    private let post: Post
    
    init(post: Post) {
        self.post = post
    }
    
    func uploadComment(commentText: String) {
        guard
            let user = AuthenticationViewModel.shared.currentUser,
            let userID = user.id,
            let postID = post.id
        else { return }
        
        let comment = Comment(
            username: user.userName,
            profileImageURL: user.profileImageURL,
            uid: userID,
            timeStamp: Timestamp(date: Date()),
            postOwnerUid: post.ownerUid,
            commentText: commentText
        )
        
        Task {
            let encodedComment = try Firestore.Encoder().encode(comment)
            
            FIRESTORE_POSTS.document(postID).collection("post-comments").addDocument(data: encodedComment) { error in
                if let error = error {
                    print("handle error")
                }
            }
        }
    }
    
    func fetchComments() {
        
    }
}
