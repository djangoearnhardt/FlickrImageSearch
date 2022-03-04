//
//  ImageSearchModel.swift
//  FlickrImageSearch
//
//  Created by Sam LoBue on 3/3/22.
//

import Foundation

struct ImageSearchModel {
    private(set) var images: Array<FlickrImage>
    
    init(images: [FlickrImage] = []) {
        self.images = images
    }
    
    /// Update images on the `ImageSearchModel` from the `ImageSearchViewModel`
    /// This is the only place we update the model
    mutating func updateImagesWith(_ imageSearchResults: [FlickrImage]) {
        self.images = imageSearchResults
    }
}
