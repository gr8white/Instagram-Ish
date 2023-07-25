//
//  CommentView.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/25/23.
//

import SwiftUI

struct CommentView: View {
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
            
            
        }
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView()
    }
}
