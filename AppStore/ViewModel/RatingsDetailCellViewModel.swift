//
//  RatingsDetailCellViewModel.swift
//  AppStore
//
//  Created by Zahra Alizada on 20.01.25.
//

import Foundation
struct RatingsDetailCellViewModel {
    let result: Entry
    init(result: Entry) {
        self.result = result
    }
    var userText: String? {
        return result.author.name.label
    }
    var titleText: String? {
        return result.title.label
    }
    var bodyText: String? {
        return result.content.label
    }
    var raitingText: String? {
        var resultText = ""
        let count = Int(result.rating.label) ?? 0
        for _ in 0...count {
            resultText.append("⭐️")
        }
        return resultText
    }
}
