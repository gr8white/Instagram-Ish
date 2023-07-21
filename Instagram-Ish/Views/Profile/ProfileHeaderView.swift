//
//  ProfileHeaderView.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/18/23.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    let user: User
    
    var body: some View {
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
                    UserStatView(count: 2, label: "Posts")
                    UserStatView(count: 1, label: "Followers")
                    UserStatView(count: 3, label: "Following")
                }
            }
            
            Text(user.fullName)
                .font(.system(size: 15, weight: .semibold))
                .padding(.top)
            
            Text("Gotham's Dark Knight || Billionaire")
                .font(.system(size: 15))
                .padding(.top, 1)
            
            ProfileActionButton(isCurrentuser: user.isCurrentUser)

        }
        .padding(.horizontal)
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: .UserExample)
            .previewLayout(.sizeThatFits)
    }
}
