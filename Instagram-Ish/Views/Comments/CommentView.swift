//
//  CommentView.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/25/23.
//

import SwiftUI

struct CommentView: View {
    @ObservedObject var viewModel: CommentViewModel
    @State var commentText: String = ""
    
    init(post: Post) {
        self.viewModel = CommentViewModel(post: post)
    }
    
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
        viewModel.uploadComment(commentText: commentText)
        commentText = ""
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView(post: Post.PostExample)
    }
}
