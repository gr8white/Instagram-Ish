//
//  SignUpViewModel.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/20/23.
//

import Foundation
import SwiftUI

class SignUpViewModel: LandingViewModel {
    @Published var email: String = ""
    @Published var userName: String = ""
    @Published var fullName: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var imagePickerPresented: Bool = false
    @Published var selectedImage: UIImage?
    @Published var userImage: Image?
}
