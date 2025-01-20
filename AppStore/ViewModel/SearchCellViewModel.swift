//
//  SearchCellViewModel.swift
//  AppStore
//
//  Created by Zahra Alizada on 24.09.24.
//

import Foundation

class SearchCellViewModel {
    let result: Result
    init(result: Result) {
        self.result = result
    }
    
    var raitingLabel: String? {
        return String(format: "%.2f", result.averageUserRating ?? 0)
    }
    var nameLabel: String? {
        return result.trackName
    }
    var categoryLabel: String? {
        return result.primaryGenreName
    }
    var appImage: URL?{
        return URL(string: result.artworkUrl100)
    }
    var screenshot1: URL?{
        guard !result.screenshotUrls.isEmpty else { return nil }
        return URL(string: result.screenshotUrls[0])
    }
    var screenshot2: URL?{
        if result.screenshotUrls.count > 1 {
            return URL(string: result.screenshotUrls[1])
        } else {
            guard !result.screenshotUrls.isEmpty else { return nil }
            return URL(string: result.screenshotUrls[0])
        }
        
    }
    var screenshot3: URL?{
        if result.screenshotUrls.count > 2 {
            return URL(string: result.screenshotUrls[2])
        } else {
            guard !result.screenshotUrls.isEmpty else { return nil }
            return URL(string: result.screenshotUrls[0])
        }
    }
}
