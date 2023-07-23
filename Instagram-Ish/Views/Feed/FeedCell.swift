//
//  FeedCell.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/17/23.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    var post: Post
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                KFImage(URL(string: post.ownerProfileImageURL))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .clipped()
                    .cornerRadius(18)
                
                Text(post.ownerUserName)
                    .font(.system(size: 14, weight: .semibold))
            }
            .padding([.bottom, .leading], 8)
            
            KFImage(URL(string: post.imageURL))
                .resizable()
                .scaledToFill()
                .frame(maxHeight: 340)
                .clipped()
            
            VStack(alignment: .leading, spacing: 3){
                HStack(spacing: 16) {
                    Button {
                        
                    } label: {
                        Image(systemName: "heart")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 20, height: 20)
                            .font(.system(size: 20))
                    }
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "bubble.right")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 20, height: 20)
                            .font(.system(size: 20))
                    }
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "paperplane")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 20, height: 20)
                            .font(.system(size: 20))
                    }

                }
                .foregroundColor(.black)
                .padding(.vertical, 4)
                
                Text("\(post.likes) likes")
                    .font(.system(size: 14, weight: .semibold))
                
                Text(post.ownerUserName).font(.system(size: 14, weight: .semibold)) + Text(" ") +  Text(post.caption).font(.system(size: 15))
                
                Text("2d")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }
            .padding(.horizontal, 8)
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell(post: .PostExample)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
