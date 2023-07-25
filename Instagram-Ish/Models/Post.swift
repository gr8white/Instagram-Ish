//
//  Post.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/22/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Post: Identifiable, Codable {
    @DocumentID var id: String?
    var caption: String
    var timeStamp: Timestamp
    var likes: Int
    var imageURL: String
    var ownerUid: String
    var ownerProfileImageURL: String
    var ownerUserName: String
    
    var didCurrentUserLike: Bool? = false
}

extension Post {
    static var PostExample = Post(caption: "", timeStamp: Timestamp(date: Date()), likes: 6, imageURL: "", ownerUid: "", ownerProfileImageURL: "", ownerUserName: "")
}
