//
//  EditProfileView.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 8/3/23.
//

import SwiftUI

struct EditProfileView: View {
    @State var bio: String = ""
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                HStack {
                    Button {
                        
                    } label: {
                        Text("Cancel")
                    }
                    
                    Spacer()
                    
                    Button {
                        
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
        EditProfileView()
            .previewLayout(.sizeThatFits)
    }
}
