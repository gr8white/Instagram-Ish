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

@MainActor
class CommentViewModel: ObservableObject {
    private let post: Post
    @Published var postComments: [Comment] = []
    
    init(post: Post) {
        self.post = post
        fetchComments()
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
                
                NotificationViewModel.uploadNotification(toUid: self.post.ownerUid, type: .comment, post: self.post)
            }
        }
    }
    
    func fetchComments() {
        guard let postID = post.id else { return }
        
        let query = FIRESTORE_POSTS.document(postID).collection("post-comments")
            .order(by: "timeStamp", descending: true)
        
        query.addSnapshotListener { snapshot, _ in
            guard let addedDocs = snapshot?.documentChanges.filter({ $0.type == .added }) else { return }
            
            self.postComments.append(contentsOf: addedDocs.compactMap({ try? $0.document.data(as: Comment.self)}))
        }
    }
}
