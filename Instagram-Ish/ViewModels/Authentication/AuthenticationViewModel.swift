//
//  AuthenticationViewModel.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/20/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class AuthenticationViewModel: ObservableObject {
    enum AuthRequestState {
        case loading
        case success
        case error(AuthErrorCode.Code)
    }
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    static let shared = AuthenticationViewModel()
    
    init() {
        self.userSession = FIREBASE_AUTH.currentUser
        
        Task {
            await fetchUser()
        }
    }
    
    func signIn(email: String, password: String, completion: @escaping (AuthRequestState) -> Void) {
        completion(.loading)
        
        FIREBASE_AUTH.signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            
            if let error = error as? NSError, let authError = AuthErrorCode.Code(rawValue: error.code) {
                completion(.error(authError))
            }
            
            if let authResult = authResult {
                Task {
                    try await Task.sleep(for:.seconds(1))
                    
                    await strongSelf.fetchUser()
                    
                    DispatchQueue.main.async {
                        strongSelf.userSession = authResult.user
                        
                        completion(.success)
                    }
                }
            }
        }
    }
    
    func signUp(_ email: String, _ password: String, _ userName: String, _ fullName: String, _ image: UIImage?, completion: @escaping (AuthRequestState) -> Void) {
        completion(.loading)
        
        guard let image = image else {
            completion(.error(.internalError))
            return
        }
        
        ImageUploader.uploadImage(image: image, type: .profileImage) { imageURL in
            FIREBASE_AUTH.createUser(withEmail: email, password: password) { [weak self] authResult, error in
                guard let strongSelf = self else { return }
                
                if let error = error as? NSError, let authError = AuthErrorCode.Code(rawValue: error.code) {
                    completion(.error(authError))
                }
                
                if let authResult = authResult {
                    Task {
                        try await Task.sleep(for:.seconds(1))
                        
                        let user = User(id: authResult.user.uid, email: email, userName: userName, fullName: fullName, profileImageURL: imageURL)
                        
                        let encodedUser = try Firestore.Encoder().encode(user)
                        
                        try await FIRESTORE_USERS.document(authResult.user.uid).setData(encodedUser)
                        
                        DispatchQueue.main.async {
                            strongSelf.userSession = authResult.user
                        }
                        
                        await strongSelf.fetchUser()
                    }
                }
            }
        }
    }
    
    func signOut(completion: @escaping (AuthRequestState) -> Void) {
        do {
            try FIREBASE_AUTH.signOut()
            self.userSession = nil
            self.currentUser = nil
        } catch {
            completion(.error(.internalError))
        }
    }
    
    func fetchUser() async {
        guard
            let uid = FIREBASE_AUTH.currentUser?.uid,
            let snapshot = try? await FIRESTORE_USERS.document(uid).getDocument() else { return }
        
        DispatchQueue.main.async {
            self.currentUser = try? snapshot.data(as: User.self)
        }
    }
    
    func resetPassword() { }
}
