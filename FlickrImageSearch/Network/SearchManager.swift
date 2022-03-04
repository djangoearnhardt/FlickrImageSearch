//
//  SearchManager.swift
//  FlickrImageSearch
//
//  Created by Sam LoBue on 3/3/22.
//

import Combine
import Foundation

class SearchManager: SearchManaging {
    static let shared = SearchManager()
    private let urlSession = URLSession.shared
    private var cancellable: AnyCancellable?

    func getPublisherFor(search: String) -> AnyPublisher<[FlickrImage], Error> {
        guard let urlRequest = buildFlickrURLRequestFor(search: search) else {
            fatalError("Invalid URL Request")
        }
        return urlSession
           .dataTaskPublisher(for: urlRequest)
           .tryMap() { element -> Data in
               guard let httpResponse = element.response as? HTTPURLResponse,
                     httpResponse.statusCode == 200 else {
                         throw URLError(.badServerResponse)
                     }
               return element.data
           }
           .receive(on: DispatchQueue.main)
           .decode(type: FlickrJSON.self, decoder: JSONDecoder())
           .map { $0.items }
           .eraseToAnyPublisher()
    }
    
    fileprivate func buildFlickrURLRequestFor(search: String) -> URLRequest? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.flickr.com"
        urlComponents.path = "/services/feeds/photos_public.gne"
        let format = URLQueryItem(name: "format", value: "json")
        let search = URLQueryItem(name: "tags", value: search)
        let callback = URLQueryItem(name: "nojsoncallback", value: "1")
        urlComponents.queryItems = [format, search, callback]
        guard let fullURL = urlComponents.url else {
            return nil
        }
        let urlRequest = URLRequest(url: fullURL)
        return urlRequest
    }
}
