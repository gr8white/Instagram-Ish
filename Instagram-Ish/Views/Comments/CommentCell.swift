//
//  CommentCell.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/25/23.
//

import SwiftUI
import Kingfisher

struct CommentCell: View {
    var comment: Comment
    
    var body: some View {
        HStack (alignment: .center) {
            KFImage(URL(string: comment.profileImageURL))
                .resizable()
                .scaledToFill()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
            
            Text(comment.username).font(.system(size: 14, weight: .semibold)) + Text(" ") +  Text(comment.commentText).font(.system(size: 14))
            
            Spacer()
            
            Text("2m")
                .foregroundColor(.gray)
                .font(.system(size: 12))
        }
        .padding(.horizontal)
    }
}

struct CommentCell_Previews: PreviewProvider {
    static var previews: some View {
        CommentCell(comment: Comment.CommentExample)
    }
}
