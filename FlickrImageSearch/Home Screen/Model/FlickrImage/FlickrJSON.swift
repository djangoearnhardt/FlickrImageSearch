//
//  FlickrJSON.swift
//  FlickrImageSearch
//
//  Created by Sam LoBue on 3/3/22.
//

import Foundation

struct FlickrJSON: Decodable {
    let title: String
    let link: String
    let description: String
    let modified: String
    let generator: String
    let items: [FlickrImage]
}
