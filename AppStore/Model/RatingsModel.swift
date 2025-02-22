//
//  RatingsModel.swift
//  AppStore
//
//  Created by Zahra Alizada on 20.01.25.
//

import Foundation
struct RatingsModel: Decodable {
    let feed: RatingFeed
}

struct RatingFeed: Decodable {
    let entry: [Entry]
}
struct Entry: Decodable {
    let author: Author
    let title: Label
    let content: Label
    let rating: Label
    private enum CodingKeys: String, CodingKey {
        case author
        case title
        case content
        case rating = "im:rating"
    }
}
struct Author: Decodable {
    let name: Label
}
struct Label: Decodable {
    let label: String
}
