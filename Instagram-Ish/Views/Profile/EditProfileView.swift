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
    
    init(user: User) {
        self.viewModel = EditProfileViewModel(user: user)
        if let currentBio = user.bio {
            self.bio = currentBio
        }
    }
    var body: some View {
        ZStack(alignment: .leading) {
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
            }
            .padding()
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(user: User.UserExample)
            .previewLayout(.sizeThatFits)
    }
}
