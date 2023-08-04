//
//  SignInView.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/19/23.
//

import SwiftUI

struct SignInView: View {
    @ObservedObject var viewModel = SignInViewModel()
    @EnvironmentObject var authVM: AuthenticationViewModel
    
    var body: some View {
        VStack {
            Image("instagram_logo")
                .resizable()
                .renderingMode(.template)
                .scaledToFit()
                .frame(width: 220, height: 70)
                .foregroundColor(.white)
                .padding(.top, 80)
            
            VStack(spacing: 20) {
                CustomTextField(text: $viewModel.email, placeholder: "Email", imageName: "envelope")
                    .textInputAutocapitalization(.never)
    
                if !viewModel.showResetPassword {
                    CustomTextField(text: $viewModel.password, placeholder: "Password", imageName: "lock", isSecured: true)
                }
                
                HStack {
                    Spacer()
                    
                    Button {
                        viewModel.showResetPassword.toggle()
                    } label: {
                        Text("Forgot Password?")
                            .font(.system(size: 13, weight: .semibold))
                            .foregroundColor(.white)
                    }
                }
                
                HStack {
                    Spacer()
                    
                    Button {
                        if !viewModel.showResetPassword {
                            signIn(email: viewModel.email, password: viewModel.password)
                        } else {
                            resetPassword()
                        }
                    } label: {
                        Text(!viewModel.showResetPassword ? "Sign In" : "Send Reset Password Link")
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
                            .tint(.white)
                            .controlSize(.large)
                    }
                    
                    if !viewModel.errorMessage.isEmpty && !viewModel.isLoading {
                        Text(viewModel.errorMessage)
                            .font(.caption)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .padding()
                            .background(Color.init(white: 1, opacity: 0.15))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                    }
                }
                .padding(.top, 48)
            }
        }
    }
    
    func signIn(email: String, password: String) {
        authVM.signIn(email: email, password: password) { signInState in
            switch signInState {
            case .loading:
                viewModel.resetErrorMessage()
                viewModel.toggleLoading()
            case .success:
                print("success")
            case .error(let signInError):
                viewModel.toggleLoading()
                switch signInError {
                case .wrongPassword:
                    viewModel.setErrorMessage(to: "The user attempted sign in with an incorrect password.")
                case .invalidEmail:
                    viewModel.setErrorMessage(to: "The email address is malformed.")
                case .userDisabled:
                    viewModel.setErrorMessage(to: "The user's account is disabled.")
                case .userNotFound:
                    viewModel.setErrorMessage(to: "The user account was not found.\nThis could happen if the user account has been deleted.")
                default:
                    viewModel.setErrorMessage(to: "Unhandled error: \(signInError.rawValue)")
                }
            }
        }
    }
    
    func resetPassword() {
        authVM.resetPassword(email: viewModel.email) { resetPasswordState in
            switch resetPasswordState {
            case .loading:
                viewModel.resetErrorMessage()
                viewModel.toggleLoading()
            case .success:
                print("success")
            case .error(let resetPasswordError):
                viewModel.toggleLoading()
                switch resetPasswordError {
                case .userNotFound:
                    viewModel.setErrorMessage(to: "The user account was not found.\nThis could happen if the user account has been deleted.")
                case .invalidEmail:
                    viewModel.setErrorMessage(to: "The email address is malformed.")
                default:
                    viewModel.setErrorMessage(to: "Unhandled error: \(resetPasswordError.rawValue)")
                }
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
            SignInView()
            Spacer()
        }
        .background(Gradient(colors: [.purple, .blue]))
    }
}
