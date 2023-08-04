//
//  EditProfileView.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 8/3/23.
//

import SwiftUI

struct EditProfileView: View {
    @ObservedObject private var viewModel: EditProfileViewModel
    @Environment(\.presentationMode) var mode
    @State var bio: String = ""
    @Binding var user: User
    
    init(user: Binding<User>) {
        self._user = user
        self.viewModel = EditProfileViewModel(user: user.wrappedValue)
        if let currentBio = user.wrappedValue.bio {
            self.bio = currentBio
        }
    }
    var body: some View {
        VStack {
            HStack {
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                }
                
                Spacer()
                
                Button {
                    viewModel.saveUserData(bio: bio) {
                        self.mode.wrappedValue.dismiss()
                    }
                } label: {
                    Text("Done").bold()
                }
            }
            
            TextArea(placeholder: "Add your bio...", text: $bio)
                .frame(height: 420)
            
            Spacer()
        }
        .padding()
    }
}
