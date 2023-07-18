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
            HStack {
                Image("batman")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .clipped()
                    .cornerRadius(18)
                
                Text("batman")
                    .font(.system(size: 14, weight: .semibold))
            }
            .padding([.bottom, .leading], 8)
            
            Image("batman")
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
                
                Text("3 likes")
                    .font(.system(size: 14, weight: .semibold))
                
                Text("batman").font(.system(size: 14, weight: .semibold)) + Text(" ") +  Text("All men have limits. They learn what they are and learn not to exceed them. I ignore mine.").font(.system(size: 15))
                
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
        FeedCell()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
