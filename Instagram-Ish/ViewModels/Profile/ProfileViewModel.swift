//
//  ProfileViewModel.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/21/23.
//

import Foundation

@MainActor
class ProfileViewModel: ObservableObject {
    @Published var user: User?
    @Published var posts: [Post] = []
    
    init(user: User?, userID: String? = "") {
        if let user = user {
            self.user = user
        } else if let userID = userID {
            fetchUser(userID)
        }
        checkIfUserIsFollowed()
        fetchPosts()
        fetchUserStats()
    }
    
    func follow() {
        guard let uid = user?.id else { return }
        
        UserService.follow(uid: uid) { _ in
            NotificationViewModel.uploadNotification(toUid: uid, type: .follow)
            
            self.user?.isFollowed = true
        }
    }
    
    func unfollow() {
        guard let uid = user?.id else { return }
        
        UserService.unFollow(uid: uid) { _ in
            self.user?.isFollowed = false
        }
    }
    
    func checkIfUserIsFollowed() {
        guard let user = user, !user.isCurrentUser, let uid = user.id else { return }

        UserService.checkIfUserIsFollowed(uid: uid) { isFollowed in
            self.user?.isFollowed = isFollowed
        }
    }
    
    func fetchPosts() {
        guard let uid = user?.id else { return }
        
        FIRESTORE_POSTS
            .whereField("ownerUid", isEqualTo: uid)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                
                let posts = documents.compactMap({ try? $0.data(as: Post.self)})
                self.posts = posts.sorted(by: { $0.timeStamp.dateValue() < $1.timeStamp.dateValue() })
            }
    }
    
    func fetchUser(_ uid: String) {
        FIRESTORE_USERS.document(uid).getDocument { snapshot, _ in
            self.user = try? snapshot?.data(as: User.self)
        }
    }
    
    func fetchUserStats() {
        guard let uid = user?.id else { return }
        
        FIRESTORE_FOLLOWING.document(uid).collection("user-following").getDocuments { snapshot, _ in
            guard let following = snapshot?.documents.count else { return }
            
            FIRESTORE_FOLLOWERS.document(uid).collection("user-followers").getDocuments { snapshot, _ in
                guard let followers = snapshot?.documents.count else { return }
                
                FIRESTORE_POSTS.whereField("ownerUid", isEqualTo: uid).getDocuments { snapshot, _ in
                    guard let posts = snapshot?.documents.count else { return }
                    
                    self.user?.stats = UserStats(following: following, posts: posts, followers: followers)
                }
            }
        }
    }
}
