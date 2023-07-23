//
//  FeedViewModel.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/22/23.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var posts: [Post] = []
    
    init() {
        fetchPosts()
    }
    
    func fetchPosts() {
        UserService.fetchAllFollowing { followedIDs in
            FIRESTORE_POSTS
                .whereField("ownerUid", in: followedIDs)
                .getDocuments { snapshot, _ in
                    guard let documents = snapshot?.documents else { return }
                    
                    self.posts = documents.compactMap({ try? $0.data(as: Post.self)})
                }
        }
    }
}
