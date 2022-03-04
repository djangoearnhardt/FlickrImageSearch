//
//  ImageSearchViewModel.swift
//  FlickrImageSearch
//
//  Created by Sam LoBue on 3/3/22.
//

import Combine
import SwiftUI

class ImageSearchViewModel: ObservableObject {
    
    // MARK: Published Properties
    @Published private var model: ImageSearchModel = ImageSearchModel()
    @Published var shouldShowError: Bool = false
    @Published var error: String?
    @Published var searchString: String = ""
    
    // MARK: Properties
    let searchManager: SearchManaging
    var images: [FlickrImage] { model.images }
    private var cancellables = Set<AnyCancellable>()
    
    // Inject network dependency for testing
    init(searchManager: SearchManaging = SearchManager()) {
        self.searchManager = searchManager
    }
    
    /// Update images on the `ImageSearchModel`
    func searchForImages() {
        guard !searchString.isEmpty else {
            return
        }
        // Subscribe to publisher
        self.searchManager.getPublisherFor(search: searchString)
            .sink { completion in
                if case let .failure(error) = completion {
                    self.error = error.localizedDescription
                    self.shouldShowError = true
                }
            } receiveValue: { images in
                self.model.updateImagesWith(images)
            }
            .store(in: &cancellables)
    }
}
