//
//  AppInfoHeaderCellViewModel.swift
//  AppStore
//
//  Created by Zahra Alizada on 18.01.25.
//

import Foundation
struct AppInfoHeaderCellViewModel {
    let result: Result
    init(result: Result) {
        self.result = result
    }
    var name: String?{
        return result.trackName
    }
    var releaseNotes: String?{
        return result.releaseNotes
    }
    var appImageUrl: URL?{
        return URL(string: result.artworkUrl100)
    }
    var formattedPrice: String? {
        return result.formattedPrice
    }
}
