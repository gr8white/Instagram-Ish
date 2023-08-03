//
//  Comment.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/25/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Comment: Codable, Hashable, Identifiable {
    @DocumentID var id: String?
    var username: String
    var profileImageURL: String
    var uid: String
    var timeStamp: Timestamp
    var postOwnerUid: String
    var commentText: String
    
    var timestampString: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        
        return formatter.string(from: timeStamp.dateValue(), to: Date()) ?? ""
    }
}

extension Comment {
    static var CommentExample: Comment = Comment(
        username: "batman",
        profileImageURL: "",
        uid: "",
        timeStamp: Timestamp(date: Date()),
        postOwnerUid: "",
        commentText: "Test comment"
    )
}
