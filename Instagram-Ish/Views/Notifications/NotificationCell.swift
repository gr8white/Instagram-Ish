//
//  NotificationCell.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/18/23.
//

import SwiftUI

struct NotificationCell: View {
    @State private var showPostImge = false
    
    var body: some View {
        HStack {
            Image("batman")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            HStack(spacing: 0) {
                Text("batman")
                    .font(.system(size: 12, weight: .semibold))
                Text(" liked one of your posts")
                    .lineLimit(1)
                    .font(.system(size: 13))
            }
            
            Spacer()
            
            if showPostImge {
                Image("batman")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
            } else {
                Button {
                    
                } label: {
                    Text("Following")
                        .padding(.horizontal, 20)
                        .padding(.vertical, 8)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        .font(.system(size: 14, weight: .semibold))
                }

            }
            
        }
        .padding(.horizontal)
    }
}

struct NotificationCell_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCell()
            .previewLayout(.sizeThatFits)
    }
}
