//
//  FeedCellViewModel.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/23/23.
//

import Foundation

class FeedCellViewModel: ObservableObject {
    @Published var post: Post
    
    init(post: Post) {
        self.post = post
    }
    
    func like() {
        print("like")
    }
    
    func unlike() {
        print("unlike")
    }
    
    func checkIfUserLikedPost() {
          
    }
}
