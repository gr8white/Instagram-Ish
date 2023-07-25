//
//  CommentView.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/25/23.
//

import SwiftUI

struct CommentView: View {
    @State var commentText: String = ""
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack (alignment: .leading, spacing: 18) {
                    ForEach(0..<10) { _ in
                        CommentCell()
                    }
                }
            }
            .padding(.top)
            
            CommentInputView(inputText: $commentText, action: uploadComment)
        }
    }
    
    func uploadComment() {
        
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView()
    }
}
