//
//  Constants.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/21/23.
//

import Foundation
import Firebase
import FirebaseStorage

let FIRESTORE = Firestore.firestore()
let FIRESTORE_USERS = FIRESTORE.collection("users")
let FIRESTORE_FOLLOWERS = FIRESTORE.collection("followers")
let FIRESTORE_FOLLOWING = FIRESTORE.collection("following")
let FIRESTORE_POSTS = FIRESTORE.collection("posts")

let FIREBASE_AUTH = Auth.auth()

let STORAGE = Storage.storage()
