//
//  CommentCell.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/25/23.
//

import SwiftUI

struct CommentCell: View {
    var body: some View {
        HStack (alignment: .center) {
            Image("batman")
                .resizable()
                .scaledToFill()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
            
            Text("batman").font(.system(size: 14, weight: .semibold)) + Text(" ") +  Text("some test comment for now").font(.system(size: 14))
            
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
        CommentCell()
    }
}
