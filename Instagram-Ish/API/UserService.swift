//
//  UserService.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/21/23.
//

import Foundation
import Firebase

typealias FirestoreErrorCompletion = (Error?) -> Void

struct UserService {
    static func follow(uid: String, completion: @escaping FirestoreErrorCompletion) {
        guard let currentUid = AuthenticationViewModel.shared.userSession?.uid else { return }
        
        FIRESTORE_FOLLOWING.document(currentUid).collection("user-following").document(uid).setData([:]) { _ in
            FIRESTORE_FOLLOWERS.document(uid).collection("user-followers").document(currentUid).setData([:], completion: completion)
        }
    }
    
    static func unFollow(uid: String, completion: @escaping FirestoreErrorCompletion) {
        guard let currentUid = AuthenticationViewModel.shared.userSession?.uid else { return }
        
        FIRESTORE_FOLLOWING.document(currentUid).collection("user-following")
            .document(uid).delete { _ in
                FIRESTORE_FOLLOWERS.document(uid).collection("user-followers")
                    .document(currentUid).delete(completion: completion)
            }
    }
    
    static func checkIfUserIsFollowed(uid: String, completion: @escaping (Bool) -> Void) {
        guard let currentUid = AuthenticationViewModel.shared.userSession?.uid else { return }
        
        FIRESTORE_FOLLOWING.document(currentUid).collection("user-following")
            .document(uid).getDocument { snapshot, _ in
                guard let isFollowed = snapshot?.exists else { return }
                completion(isFollowed)
            }
    }
    
    static func fetchAllFollowing(completion: @escaping ([String]) -> Void) {
        guard let currentUid = AuthenticationViewModel.shared.userSession?.uid else { return }
        
        FIRESTORE_FOLLOWING.document(currentUid).collection("user-following").getDocuments { snapshot, _ in
            guard let followedIDs = snapshot?.documents else { return }
            
            completion(followedIDs.compactMap({ $0.documentID }))
        }
    }
}
