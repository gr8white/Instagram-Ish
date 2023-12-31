//
//  SearchView.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/17/23.
//

import SwiftUI

struct SearchView: View {
    @State var searchText: String = ""
    @State var inSearchMode: Bool = false
    @ObservedObject var viewModel = SearchViewModel()
    
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText, isEditing: $inSearchMode)
                .padding()
            
            if inSearchMode {
                UserListView(viewModel: viewModel, searchText: $searchText)
            } else {
                PostGridView(posts: viewModel.posts)
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
