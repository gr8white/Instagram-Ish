//
//  FeedCellViewModel.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/23/23.
//

import Foundation

class FeedCellViewModel: ObservableObject {
    @Published var post: Post
    
    init(post: Post) {
        self.post = post
    }
    
    var likeString: String {
        let label = post.likes == 1 ? "like" : "likes"
        return "\(post.likes) \(label)"
    }
    
    func like() {
        guard
            let uid = AuthenticationViewModel.shared.userSession?.uid,
            let postID = post.id
        else { return }
        FIRESTORE_POSTS.document(postID).collection("post-likes")
            .document(uid).setData([:]) { _ in
                FIRESTORE_USERS.document(uid).collection("user-likes")
                    .document(postID).setData([:]) { _ in
                        
                        FIRESTORE_POSTS.document(postID).updateData(["likes" : self.post.likes + 1])
                        self.post.didCurrentUserLike = true
                        self.post.likes += 1
                    }
            }
    }
    
    func unlike() {
        print("unlike")
    }
    
    func checkIfUserLikedPost() {
          
    }
}
