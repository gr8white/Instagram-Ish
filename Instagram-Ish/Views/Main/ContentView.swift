//
//  ContentView.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/17/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authVM: AuthenticationViewModel
    
    var body: some View {
        Group {
            if authVM.userSession != nil {
                MainTabView()
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
