//
//  ProfileHeaderView.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/18/23.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        if let user = viewModel.user {
            VStack(alignment: .leading) {
                HStack {
                    KFImage(URL(string: user.profileImageURL))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .clipped()
                        .clipShape(Circle())
                    
                    Spacer()
                    
                    HStack {
                        UserStatView(count: viewModel.user?.stats?.posts ?? 0, label: "Posts")
                        UserStatView(count: viewModel.user?.stats?.followers ?? 0, label: "Followers")
                        UserStatView(count: viewModel.user?.stats?.following ?? 0, label: "Following")
                    }
                }
                
                Text(user.fullName)
                    .font(.system(size: 15, weight: .semibold))
                    .padding(.top)
                
                Text("Gotham's Dark Knight || Billionaire")
                    .font(.system(size: 15))
                    .padding(.top, 1)
                
                HStack {
                    Spacer()
                    
                    ProfileActionButton(viewModel: viewModel)
                    
                    Spacer()
                }
            }
            .padding(.horizontal)
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(viewModel: ProfileViewModel(user: .UserExample))
            .previewLayout(.sizeThatFits)
    }
}
