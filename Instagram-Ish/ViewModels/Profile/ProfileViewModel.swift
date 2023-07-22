//
//  ProfileViewModel.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/21/23.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
    
    func follow() {
        guard let uid = user.id else { return }
        
        UserService.follow(uid: uid) { _ in
            print("successfully followed \(self.user.userName)")
            self.user.isFollowed = true
        }
    }
    
    func unfollow() {
        
    }
    
    func checkIfUserIsFollowed() {
        
    }
}
