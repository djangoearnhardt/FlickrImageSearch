//
//  MockFlickrImage.swift
//  FlickrImageSearch
//
//  Created by Sam LoBue on 3/3/22.
//

import Foundation

struct MockFlickrImage {
    static let imagePreview = FlickrImage(
        title: "What Time Does the CVS Open?",
        link: "https://www.flickr.com/photos/thomashawk/51879019886/",
        media: ["m" : "https://live.staticflickr.com/65535/51879019886_451fc9306f_m.jpg"],
        date: "2016-10-30T04:48:23-08:00",
        description: " <p><a href=\"https://www.flickr.com/people/thomashawk/\">Thomas Hawk</a> posted a photo:</p> <p><a href=\"https://www.flickr.com/photos/thomashawk/51879019886/\" title=\"What Time Does the CVS Open?\"><img src=\"https://live.staticflickr.com/65535/51879019886_451fc9306f_m.jpg\" width=\"240\" height=\"160\" alt=\"What Time Does the CVS Open?\" /></a></p> ",
        published: "2022-02-13T13:07:08Z",
        author: "nobody@flickr.com (\"Thomas Hawk\")",
        authorID: "51035555243@N01",
        tags: "america cvs kansascity missouri usa unitedstates unitedstatesofamerica parkinglot pharmacy fav10 fav25",
        id: UUID().uuidString)
    
    static let failedImagePreview = FlickrImage(
        title: "What Time Does the CVS Open?",
        link: "https://www.flickr.com/photos/thomashawk/51879019886/",
        media: [ : ],
        date: "2016-10-30T04:48:23-08:00",
        description: " <p><a href=\"https://www.flickr.com/people/thomashawk/\">Thomas Hawk</a> posted a photo:</p> <p><a href=\"https://www.flickr.com/photos/thomashawk/51879019886/\" title=\"What Time Does the CVS Open?\"><img src=\"https://live.staticflickr.com/65535/51879019886_451fc9306f_m.jpg\" width=\"240\" height=\"160\" alt=\"What Time Does the CVS Open?\" /></a></p> ",
        published: "2022-02-13T13:07:08Z",
        author: "nobody@flickr.com (\"Thomas Hawk\")",
        authorID: "51035555243@N01",
        tags: "america cvs kansascity missouri usa unitedstates unitedstatesofamerica parkinglot pharmacy fav10 fav25",
        id: UUID().uuidString)
}
