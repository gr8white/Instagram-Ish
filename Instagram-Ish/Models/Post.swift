//
//  Post.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/22/23.
//

import Foundation
import Firebase

struct Post: Encodable {
    var caption: String
    var timeStamp: Timestamp
    var likes: Int
    var imageURL: String
    var ownerUid: String
    var ownerProfileImageURL: String
    var ownerUserName: String
}
