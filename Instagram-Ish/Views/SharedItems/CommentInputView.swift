//
//  CommentInputView.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/25/23.
//

import SwiftUI

struct CommentInputView: View {
    @Binding var inputText: String
    var action: () -> Void
    
    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(Color(.separator))
                .frame(width: UIScreen.main.bounds.width, height: 0.75)
                .padding(.bottom, 8)
            
            HStack {
                TextField("Comment...", text: $inputText)
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(minHeight: 30)
                
                Button {
                    action()
                } label: {
                    Text("Send")
                        .bold()
                        .foregroundColor(.black)
                }
            }
            .padding(.horizontal)
        }
        .padding(.bottom, 8)
    }
}

struct CustomInputView_Previews: PreviewProvider {
    static var previews: some View {
        CommentInputView(inputText: .constant("")) {
            
        }
        .previewLayout(.sizeThatFits)
    }
}
