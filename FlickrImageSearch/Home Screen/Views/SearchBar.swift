//
//  SearchBar.swift
//  FlickrImageSearch
//
//  Created by Sam LoBue on 3/3/22.
//

import SwiftUI

struct SearchBar: View {
    @ObservedObject var viewModel: ImageSearchViewModel
    
    var body: some View {
        HStack {
            TextField("Start Typing",
                      text: $viewModel.searchString,
                      onCommit: { self.performSearch() })
                .onChange(of: viewModel.searchString, perform: { newValue in
                    self.performSearch()
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button(action: {
                self.performSearch()
            }) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.white)
            }
        }
        .padding()
        .background(Color.blue.opacity(0.75))
    }
    
    private func performSearch() {
        viewModel.searchForImages()
    }
}

struct SearchBar_Previews: PreviewProvider {
    static let shouldShowPlaceholder = true
    static var previews: some View {
        SearchBar(viewModel: ImageSearchViewModel())
    }
}
