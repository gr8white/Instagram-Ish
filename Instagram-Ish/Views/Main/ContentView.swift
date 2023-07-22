//
//  ContentView.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/17/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authVM: AuthenticationViewModel
    @State var selectedTabIndex: Int = 0
    
    var body: some View {
        Group {
            if authVM.userSession != nil {
                if let user = authVM.currentUser {
                    MainTabView(user: user, selectedIndex: $selectedTabIndex)
                }
            } else {
                LandingView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let authVM = AuthenticationViewModel()
    
    static var previews: some View {
        ContentView()
            .environmentObject(authVM)
    }
}
