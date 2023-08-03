//
//  NotificationCell.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/18/23.
//

import SwiftUI
import Kingfisher

struct NotificationCell: View {
    @ObservedObject var viewModel: NotificationCellViewModel
    
    init(notification: Notification) {
        self.viewModel = NotificationCellViewModel(notification: notification)
    }
    
    var isFollowed: Bool { return viewModel.notification.isFollowed ?? false }
    
    var body: some View {
        HStack {
            NavigationLink {
                ProfileView(user: nil, userID: viewModel.notification.uid)
            } label: {
                KFImage(URL(string: viewModel.notification.profileImageURL))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                HStack(spacing: 0) {
                    Text(viewModel.notification.username)
                        .font(.system(size: 12, weight: .semibold))
                    Text(viewModel.notification.type.notificationMessage)
                        .font(.system(size: 13))
                }
            }
            
            Spacer()
            
            if viewModel.notification.type != .follow {
                if let post = viewModel.notification.post {
                    NavigationLink {
                        FeedCell(post: post)
                    } label: {
                        KFImage(URL(string: post.imageURL))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .clipped()
                    }
                }
            } else {
                Button {
                    isFollowed ? viewModel.unfollow() : viewModel.follow()
                } label: {
                    Text(isFollowed ? "Following" : "Follow")
                        .padding(.horizontal, 20)
                        .padding(.vertical, 8)
                        .foregroundColor(isFollowed ? .black : .white)
                        .background(isFollowed ? Color.white : Color.blue)
                        .cornerRadius(3)
                        .overlay (
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(isFollowed ? Color.gray : Color.blue, lineWidth: 1)
                        )
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
