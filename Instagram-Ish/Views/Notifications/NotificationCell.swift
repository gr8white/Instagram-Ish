//
//  NotificationCell.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/18/23.
//

import SwiftUI
import Kingfisher

struct NotificationCell: View {
    let notification: Notification
    
    var body: some View {
        HStack {
            KFImage(URL(string: notification.profileImageURL))
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            HStack(spacing: 0) {
                Text(notification.username)
                    .font(.system(size: 12, weight: .semibold))
                Text(notification.type.notificationMessage)
                    .lineLimit(1)
                    .font(.system(size: 13))
            }
            
            Spacer()
            
            if notification.type != .follow {
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
        NotificationCell(notification: Notification.NotificationExample)
            .previewLayout(.sizeThatFits)
    }
}
