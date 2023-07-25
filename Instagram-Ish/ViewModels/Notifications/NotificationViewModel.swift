//
//  NotificationViewModel.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/25/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

@MainActor
class NotificationViewModel: ObservableObject {
    @Published var notifications: [Notification] = []
    
    func fetchNotifications() {
        
    }
    
    static func uploadNotification(toUid uid: String, type: NotificationType, post: Post? = nil) {
        guard
            let user = AuthenticationViewModel.shared.currentUser,
            let userID = user.id
        else { return }
        
        var notification = Notification(
            profileImageURL: user.profileImageURL,
            timeStamp: Timestamp(date: Date()),
            type: type.rawValue,
            uid: userID,
            username: user.userName
        )
        
        if let post = post, let postID = post.id {
            notification.postID = postID
        }
        
        Task {
            let encodedNotification = try Firestore.Encoder().encode(notification)
            
            FIRESTORE_NOTIFICATIONS.document(uid).collection("user-notifications").addDocument(data: encodedNotification) { error in
                if let error = error {
                    print("handle error")
                }
            }
        }
    }
}
