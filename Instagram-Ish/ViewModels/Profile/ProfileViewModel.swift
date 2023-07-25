//
//  ProfileViewModel.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/21/23.
//

import Foundation

@MainActor
class ProfileViewModel: ObservableObject {
    @Published var user: User
    @Published var posts: [Post] = []
    
    init(user: User) {
        self.user = user
        checkIfUserIsFollowed()
        fetchPosts()
    }
    
    func follow() {
        guard let uid = user.id else { return }
        
        UserService.follow(uid: uid) { _ in
            NotificationViewModel.uploadNotification(toUid: uid, type: .follow)
            
            self.user.isFollowed = true
        }
    }
    
    func unfollow() {
        guard let uid = user.id else { return }
        
        UserService.unFollow(uid: uid) { _ in
            self.user.isFollowed = false
        }
    }
    
    func checkIfUserIsFollowed() {
        guard !user.isCurrentUser, let uid = user.id else { return }

        UserService.checkIfUserIsFollowed(uid: uid) { isFollowed in
            self.user.isFollowed = isFollowed
        }
    }
    
    func fetchPosts() {
        guard let uid = user.id else { return }
        
        FIRESTORE_POSTS
            .whereField("ownerUid", isEqualTo: uid)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                
                self.posts = documents.compactMap({ try? $0.data(as: Post.self)})
            }
    }
}
