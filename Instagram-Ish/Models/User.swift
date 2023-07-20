//
//  User.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/20/23.
//

import Foundation

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let email: String
    let fullName: String
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullName) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        
        return ""
    }
}

extension User {
    static var UserExample = User(id: NSUUID().uuidString, email: "test@test.com", fullName: "Test User")
}
