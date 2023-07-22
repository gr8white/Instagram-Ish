//
//  Constants.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/21/23.
//

import Foundation
import Firebase

let FIRESTORE = Firestore.firestore()
let FIRESTORE_USERS = FIRESTORE.collection("users")
let FIRESTORE_FOLLOWERS = FIRESTORE.collection("followers")
let FIRESTORE_FOLLOWING = FIRESTORE.collection("following")

let FIREBASE_AUTH = Auth.auth()
