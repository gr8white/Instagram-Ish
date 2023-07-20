//
//  Instagram_IshApp.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/17/23.
//

import SwiftUI
import Firebase

@main
struct Instagram_IshApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            LandingView()
                .environmentObject(AuthenticationViewModel())
        }
    }
}
