//
//  UserService.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/21/23.
//

import Foundation
import Firebase

struct UserService {
    static func follow(uid: String, completion: @escaping (Error?) -> Void) {
        guard let currentUid = AuthenticationViewModel.shared.userSession?.uid else { return }
        
        FIRESTORE_FOLLOWING.document(currentUid).collection("user-following").document(uid).setData([:]) { _ in
            FIRESTORE_FOLLOWERS.document(uid).collection("user-followers").document(currentUid).setData([:], completion: completion)
        }
    }
    
    static func unFollow() {
        
    }
    
    static func checkIfUserIsFollowed() {
        
    }
}
