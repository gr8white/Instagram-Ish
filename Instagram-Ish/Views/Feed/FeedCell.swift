//
//  FeedCell.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/17/23.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack(alignment: .leading) {
            // User Info
            HStack {
                Image(systemName: "house")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .clipped()
                    .cornerRadius(18)
                
                Text("Joker")
                    .font(.system(size: 14, weight: .semibold))
            }
            
            // Post Image
            Image(systemName: "house")
                .resizable()
                .scaledToFill()
                .frame(maxHeight: 340)
//                .clipped()
            
            // Action Buttons
            HStack(spacing: 8) {
                Button {
                    
                } label: {
                    Image(systemName: "heart")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 28, height: 28)
                        .font(.system(size: 20))
                        .padding(4)
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "bubble.right")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 28, height: 28)
                        .font(.system(size: 20))
                        .padding(4)
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "paperplane")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 28, height: 28)
                        .font(.system(size: 20))
                        .padding(4)
                }

            }
            .foregroundColor(.black)
            
            // Caption
            HStack {
                Text("batman").font(.system(size: 14, weight: .semibold)) + Text(" ") +  Text("All men have limits. They learn what they are and learn not to eceed them. I ignor mine.").font(.system(size: 15))
            }
            
            Text("2d")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .padding(.top)
        }
        .padding()
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell()
    }
}
