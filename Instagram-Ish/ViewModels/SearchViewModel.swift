//
//  SearchViewModel.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/21/23.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        FIRESTORE_USERS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            
            self.users = documents.compactMap({ try? $0.data(as: User.self) })
        }
    }
    
    func filteredUsers(_ query: String) -> [User] {
        let lowercasedQuery = query.lowercased()
        
        return users.filter {
            $0.fullName.lowercased().contains(lowercasedQuery) ||
            $0.userName.lowercased().contains(lowercasedQuery)
        }
    }
}
