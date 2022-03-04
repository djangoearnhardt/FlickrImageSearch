//
//  String+Extensions.swift
//  FlickrImageSearch
//
//  Created by Sam LoBue on 3/3/22.
//

/*
 Adapted from SO, solution for extracting a substring with a matching criteria
 */
extension String {
    func ranges(of string: String, options: CompareOptions = .literal) -> [Range<Index>] {
        var rangeIndices: [Range<Index>] = []
        var startIndex = startIndex
        while let range = range(of: string, options: options, range: startIndex..<endIndex) {
            rangeIndices.append(range)
            startIndex = range.lowerBound < range.upperBound ? range.upperBound : index(range.lowerBound, offsetBy: 1, limitedBy: endIndex) ?? endIndex
        }
        return rangeIndices
    }
    
    func slices(from: String, to: String) -> Substring? {
        let matchingPattern = "(?<=" + from + ").*?(?=" + to + ")"
        return ranges(of: matchingPattern, options: .regularExpression)
            .map{ self[$0] }.first
    }
}
