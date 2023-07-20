//
//  SignUpView.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/19/23.
//

import SwiftUI

struct SignUpView: View {
    @ObservedObject var viewModel = SignUpViewModel()
    @EnvironmentObject var authVM: AuthenticationViewModel
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                if viewModel.userImage == nil {
                    Button {
                        viewModel.imagePickerPresented = true
                    } label: {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .renderingMode(.template)
                            .scaledToFill()
                            .frame(width: 140, height: 140)
                            .foregroundColor(.white)
                            .padding(.top, 40)
                    }
                    .sheet(isPresented: $viewModel.imagePickerPresented, onDismiss: loadImage) {
                        ImagePicker(image: $viewModel.selectedImage)
                    }
                } else if let image = viewModel.userImage {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 140, height: 140)
                        .clipShape(Circle())
                        .padding(.top, 40)
                }
            
                CustomTextField(text: $viewModel.email, placeholder: "Email", imageName: "envelope")
                    .autocapitalization(.none)
                
                CustomTextField(text: $viewModel.userName, placeholder: "User Name", imageName: "person")
                    .autocapitalization(.none)
                
                CustomTextField(text: $viewModel.fullName, placeholder: "Full Name", imageName: "person")
    
                CustomTextField(text: $viewModel.password, placeholder: "Password", imageName: "lock", isSecured: true)
                
                HStack {
                    Spacer()
                    
                    Button {
                        signUp(
                            viewModel.email,
                            viewModel.password,
                            viewModel.userName,
                            viewModel.fullName
                        )
                    } label: {
                        Text("Sign Up")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                }
                .frame(height: 50)
                .background(Color.purple)
                .clipShape(Capsule())
                
                Group {
                    if viewModel.isLoading && viewModel.errorMessage.isEmpty {
                        ProgressView()
                            .tint(.blue)
                            .controlSize(.large)
                    }
                    
                    if !viewModel.errorMessage.isEmpty && !viewModel.isLoading {
                        Text(viewModel.errorMessage)
                            .font(.caption)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.red)
                    }
                }
                .padding(.top, 48)
            }
        }
    }
    
    func signUp(_ email: String, _ password: String, _ userName: String, _ fullName: String) {
        authVM.signUp(email, password, userName, fullName) { signUpState in
            switch signUpState {
            case .loading:
                viewModel.resetErrorMessage()
                viewModel.toggleLoading()
            case .success:
                print("success")
            case .error(let signUpError):
                viewModel.toggleLoading()
                switch signUpError {
                case .invalidEmail:
                    viewModel.setErrorMessage(to: "The email address is malformed.")
                case .emailAlreadyInUse:
                    viewModel.setErrorMessage(to: "The email used to attempt sign up already exists.")
                case .weakPassword:
                    viewModel.setErrorMessage(to: "This password is considered too weak.")
                default:
                    viewModel.setErrorMessage(to: "Unhandled error: \(signUpError.rawValue)")
                }
            }
        }
    }
}

extension SignUpView {
    func loadImage() {
        guard let selectedImage = viewModel.selectedImage else { return }
        
        viewModel.userImage = Image(uiImage: selectedImage)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
