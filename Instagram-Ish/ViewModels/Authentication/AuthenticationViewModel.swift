//
//  AuthenticationViewModel.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/20/23.
//

import Foundation
import Firebase

class AuthenticationViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    func signIn() { }
    
    func signUp() { }
    
    func signOut() { }
    
    func fetchUser() { }
    
    func resetPassword() { }
}
