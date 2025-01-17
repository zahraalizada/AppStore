//
//  AppCellDetailViewModel.swift
//  AppStore
//
//  Created by Zahra Alizada on 17.01.25.
//

import Foundation
struct AppCellDetailViewModel {
    let result: FeedResult
    init(result: FeedResult) {
        self.result = result
    }
    var appImageURL: URL? {
        return URL(string: result.artworkUrl100)
    }
    var artistName: String?{
        return result.artistName
    }
    var name: String?{
        return result.name
    }
}
