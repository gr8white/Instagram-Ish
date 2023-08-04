//
//  User.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/20/23.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Identifiable, Codable {
    @DocumentID var id: String?
    let email: String
    let userName: String
    let fullName: String
    let profileImageURL: String
    var isFollowed: Bool? = false
    var stats: UserStats?
    var bio: String?
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullName) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        
        return ""
    }
    
    var isCurrentUser: Bool { AuthenticationViewModel.shared.userSession?.uid == id }
}

extension User {
    static var UserExample = User(id: NSUUID().uuidString, email: "test@test.com", userName: "testUser", fullName: "Test User", profileImageURL: "")
}

struct UserStats: Codable {
    var following: Int
    var posts: Int
    var followers: Int
}
