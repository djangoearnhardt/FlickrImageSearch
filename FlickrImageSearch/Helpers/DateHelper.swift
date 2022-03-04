//
//  DateHelper.swift
//  FlickrImageSearch
//
//  Created by Sam LoBue on 3/3/22.
//

import Foundation

class DateHelper {
    
    static let shared = DateHelper()
    let dateFormatter = DateFormatter()
    
    private init () {}
    
    func monthDayYearFrom(_ dateString: String) -> String {
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: dateString)
        dateFormatter.dateFormat = "MMMM d, yyyy"
        if let date = date {
            let formattedString = dateFormatter.string(from: date)
            return formattedString
        } else {
            return dateString
        }
    }
}
