//
//  ImageSearchScreen.swift
//  FlickrImageSearch
//
//  Created by Sam LoBue on 3/3/22.
//

import SwiftUI

struct ImageSearchScreen: View {
    @ObservedObject var viewModel: ImageSearchViewModel
    @State private var shouldShowDetailView = false
    @State private var detailImage: FlickrImage? = nil
    
    var body: some View {
        ScrollView {
            SearchBar(viewModel: viewModel)
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(viewModel.images) { image in
                    ImageThumbnail(image: image)
                        .aspectRatio(1, contentMode: .fit)
                        .onTapGesture {
                            // Express user's intent
                            shouldShowDetailView.toggle()
                            detailImage = image
                        }
                }
                NavigationLink("",
                               destination: ImageDetailView(image: detailImage),
                               isActive: $shouldShowDetailView)
            }
        }
        .padding(.horizontal)
    }
}

struct ImageSearchScreen_Previews: PreviewProvider {
    static let viewModel = ImageSearchViewModel()
    static var previews: some View {
        ImageSearchScreen(viewModel: viewModel)
    }
}
