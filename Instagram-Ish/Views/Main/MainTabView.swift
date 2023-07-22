//
//  MainTabView.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/17/23.
//

import SwiftUI

struct MainTabView: View {
    let user: User
    @Binding var selectedIndex: Int
    
    var body: some View {
        NavigationStack {
            TabView(selection: $selectedIndex) {
                FeedView()
                    .onTapGesture {
                        selectedIndex = 0
                    }
                    .tabItem {
                        Image(systemName: "house")
                    }.tag(0)
                
                SearchView()
                    .onTapGesture {
                        selectedIndex = 1
                    }
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }.tag(1)
                
                UploadPostView(tabIndex: $selectedIndex)
                    .onTapGesture {
                        selectedIndex = 2
                    }
                    .tabItem {
                        Image(systemName: "plus.square")
                    }.tag(2)
                
                NotificationsView()
                    .onTapGesture {
                        selectedIndex = 3
                    }
                    .tabItem {
                        Image(systemName: "heart")
                    }.tag(3)
                
                ProfileView(user: user)
                    .onTapGesture {
                        selectedIndex = 4
                    }
                    .tabItem {
                        Image(systemName: "person")
                    }.tag(4)
            }
            .navigationTitle(tabTitle)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: logOutButton)
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
    
    var tabTitle: String {
        switch selectedIndex {
        case 0: return "Feed"
        case 1: return "Explore"
        case 2: return "New Post"
        case 3: return "Notifications"
        case 4: return "Profile"
        default: return ""
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView(user: .UserExample, selectedIndex: .constant(0))
    }
}
