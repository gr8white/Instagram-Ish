//
//  ProfileActionButton.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/18/23.
//

import SwiftUI

struct ProfileActionButton: View {
    var isCurrentuser: Bool = true
    var isFollowed: Bool = false
    
    var body: some View {
        if isCurrentuser {
            Button {
                
            } label: {
                Text("Edit Profile")
                    .font(.system(size: 14, weight: .semibold))
                    .frame(width: 360, height: 32)
                    .foregroundColor(.black)
                    .overlay (
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(Color.gray, lineWidth: 1)
                    )
            }
        } else {
            HStack {
                Button {
                    
                } label: {
                    Text(isFollowed ? "Following" : "Follow")
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: 170, height: 32)
                        .foregroundColor(isFollowed ? .black : .white)
                        .background(isFollowed ? Color.white : Color.blue)
                        .overlay (
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(isFollowed ? Color.gray : Color.blue, lineWidth: 1)
                        )
                }
                .cornerRadius(3)
                
                Button {
                    
                } label: {
                    Text("Message")
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: 170, height: 32)
                        .foregroundColor(.black)
                        .overlay (
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                }
            }
        }
    }
}

struct ProfileActionButton_Previews: PreviewProvider {
    static var previews: some View {
        ProfileActionButton()
    }
}