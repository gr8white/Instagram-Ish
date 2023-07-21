//
//  UserListView.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/18/23.
//

import SwiftUI

struct UserListView: View {
    @ObservedObject var viewModel: SearchViewModel
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.users) { user in
                    NavigationLink {
                        ProfileView()
                    } label: {
                        UserCell(userName: user.userName, fullName: user.fullName)
                    }
                }
            }
            .padding(.leading)
        }
    }
}

//struct UserListView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserListView()
//    }
//}
