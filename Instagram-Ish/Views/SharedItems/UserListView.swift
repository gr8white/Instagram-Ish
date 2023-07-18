//
//  UserListView.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/18/23.
//

import SwiftUI

struct UserListView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0..<20) { _ in
                    UserCell()
                }
            }
            .padding(.leading)
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
