//
//  Notification.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/25/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Notification: Identifiable, Codable {
    @DocumentID var id: String?
    var postID: String?
    var profileImageURL: String
    var timeStamp: Timestamp
    var type: NotificationType
    var uid: String
    var username: String
    var isFollowed: Bool? = false
    var post: Post?
    var user: User?
    
    var timestampString: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        
        return formatter.string(from: timeStamp.dateValue(), to: Date()) ?? ""
    }
}

enum NotificationType: Int, Codable {
    case like
    case comment
    case follow
    
    var notificationMessage: String {
        switch self {
        case .like: return " liked one of your posts."
        case .comment: return " commented on of your posts."
        case .follow: return " started following you."
        }
    }
}

extension Notification {
    static var NotificationExample = Notification (
        postID: "",
        profileImageURL: "",
        timeStamp: Timestamp(date: Date()),
        type: NotificationType(rawValue: 0)!,
        uid: "",
        username: ""
    )
}
