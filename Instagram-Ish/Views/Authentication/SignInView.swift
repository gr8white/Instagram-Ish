//
//  SignInView.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/19/23.
//

import SwiftUI

struct SignInView: View {
    @State private var email: String = ""
    @State private var password: String = ""
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
                CustomTextField(text: $email, placeholder: "Email", imageName: "envelope")
    
                CustomTextField(text: $password, placeholder: "Password", imageName: "lock", isSecured: true)
                
                HStack {
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Forgot Password?")
                            .font(.system(size: 13, weight: .semibold))
                            .foregroundColor(.white)
                    }
                }
                
                HStack {
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Sign In")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                }
                .frame(height: 50)
                .background(Color.purple)
                .clipShape(Capsule())
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
