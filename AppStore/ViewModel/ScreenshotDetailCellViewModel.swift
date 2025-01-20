//
//  ScreenshotDetailCellViewModel.swift
//  AppStore
//
//  Created by Zahra Alizada on 19.01.25.
//

import UIKit
struct ScreenshotDetailCellViewModel {
    let result: String
    init(result: String) {
        self.result = result
    }
    var imagrURL: URL? {
        return URL(string: result)
    }
}
