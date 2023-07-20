//
//  SignUpView.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/19/23.
//

import SwiftUI

struct SignUpView: View {
    @State private var email: String = ""
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var password: String = ""
    @State private var imagePickerPresented: Bool = false
    @State private var selectedImage: UIImage?
    @State private var userImage: Image?
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                if userImage == nil {
                    Button {
                        imagePickerPresented = true
                    } label: {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .renderingMode(.template)
                            .scaledToFill()
                            .frame(width: 140, height: 140)
                            .foregroundColor(.white)
                            .padding(.top, 40)
                    }
                    .sheet(isPresented: $imagePickerPresented, onDismiss: loadImage) {
                        ImagePicker(image: $selectedImage)
                    }
                } else if let image = userImage {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 140, height: 140)
                        .clipShape(Circle())
                        .padding(.top, 40)
                }
            
                CustomTextField(text: $email, placeholder: "Email", imageName: "envelope")
                
                CustomTextField(text: $firstName, placeholder: "First Name", imageName: "person")
                
                CustomTextField(text: $email, placeholder: "Second Name", imageName: "person")
    
                CustomTextField(text: $password, placeholder: "Password", imageName: "lock", isSecured: true)
                
                HStack {
                    Spacer()
                    
                    Button {
                        
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
            }
        }
    }
}

extension SignUpView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        
        userImage = Image(uiImage: selectedImage)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
