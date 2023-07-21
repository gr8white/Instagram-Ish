//
//  MainTabView.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/17/23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        NavigationStack {
            TabView {
                FeedView()
                    .tabItem {
                        Image(systemName: "house")
                    }
                
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }
                
                UploadPostView()
                    .tabItem {
                        Image(systemName: "plus.square")
                    }
                
                NotificationsView()
                    .tabItem {
                        Image(systemName: "heart")
                    }
                
//                ProfileView(user)
//                    .tabItem {
//                        Image(systemName: "person")
//                    }
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: logOutButton)
            .accentColor(.black)
        }
    }
    
    var logOutButton: some View {
        Button {
            AuthenticationViewModel.shared.signOut() { signOutState in
                print(signOutState)
            }
        } label: {
            Text("Sign Out")
                .foregroundColor(.black)
                .font(.system(size: 16, weight: .semibold))
        }

    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
