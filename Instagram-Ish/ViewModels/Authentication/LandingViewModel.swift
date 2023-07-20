//
//  LandingViewModel.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/20/23.
//

import Foundation

class LandingViewModel: ObservableObject {
    @Published var errorMessage: String = ""
    @Published var isLoading: Bool = false

    func setErrorMessage(to newMessage: String) { errorMessage = newMessage }
    
    func resetErrorMessage() { setErrorMessage(to: "") }
    
    func toggleLoading() { isLoading.toggle() }
}
