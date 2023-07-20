//
//  CustomTextField.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/20/23.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    var placeholder: String
    var imageName: String
    var isSecured: Bool = false
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
            
            ZStack(alignment: .leading) {
                if text.isEmpty {
                    Text(placeholder)
                        .foregroundColor(Color.init(white: 1, opacity: 0.8))
                }
                
                if isSecured {
                    SecureField("", text: $text)
                } else {
                    TextField("", text: $text)
                }
            }
        }
        .padding()
        .background(Color.init(white: 1, opacity: 0.15))
        .cornerRadius(10)
        .foregroundColor(.white)
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(text: .constant("we lit"), placeholder: "Email", imageName: "envelope")
            .previewLayout(.sizeThatFits)
            .background(Color.blue)
    }
}
