//
//  FlickrImage.swift
//  FlickrImageSearch
//
//  Created by Sam LoBue on 3/3/22.
//

import Foundation

struct FlickrImage: Identifiable {
    let title: String
    let link: String
    let media: [String: String]
    let date: String
    let description: String
    let published: String
    let author: String
    let authorID: String
    let tags: String
    let id: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case link
        case media
        case date = "date_taken"
        case description
        case published
        case author
        case authorID = "author_id"
        case tags
    }
}

extension FlickrImage: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decode(String.self, forKey: .title)
        link = try values.decode(String.self, forKey: .link)
        media = try values.decode(Dictionary<String, String>.self, forKey: .media)
        date = try values.decode(String.self, forKey: .date)
        description = try values.decode(String.self, forKey: .description)
        published = try values.decode(String.self, forKey: .published)
        author = try values.decode(String.self, forKey: .author)
        authorID = try values.decode(String.self, forKey: .authorID)
        tags = try values.decode(String.self, forKey: .tags)
        id = UUID().uuidString
    }
}

// MARK: - Convenience Properties
extension FlickrImage {
    var imageWidth: String? {
        if let width = description.slices(from: "width=\"", to: "\"") {
            return String(width)
        }
        return nil
    }
    
    var imageHeight: String? {
        if let height = description.slices(from: "height=\"", to: "\"") {
            return String(height)
        }
        return nil
    }
    
    var imageDateFormatted: String {
        return DateHelper.shared.monthDayYearFrom(date)
    }
}
