//
//  EditProfileViewModel.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 8/3/23.
//

import Foundation

class EditProfileViewModel: ObservableObject {
    private let user: User
    
    init(user: User) {
        self.user = user
    }
    
    func saveUserData(bio: String, completion: @escaping () -> Void) {
        guard let uid = user.id else { return }
        FIRESTORE_USERS.document(uid).updateData(["bio": bio]) { _ in
            completion()
        }
    }
}
