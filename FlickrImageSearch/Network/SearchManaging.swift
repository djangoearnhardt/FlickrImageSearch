//
//  SearchManaging.swift
//  FlickrImageSearch
//
//  Created by Sam LoBue on 3/3/22.
//

import Combine

/// Protocol allows for dependency injecting and testing
protocol SearchManaging {
    func getPublisherFor(search: String) -> AnyPublisher<[FlickrImage], Error>
}
