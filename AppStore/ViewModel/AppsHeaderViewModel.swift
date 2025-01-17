//
//  AppsHeaderViewModel.swift
//  AppStore
//
//  Created by Zahra Alizada on 17.01.25.
//

import Foundation

struct AppsHeaderViewModel {
    let result: AppHeaderModel
    init(result: AppHeaderModel) {
        self.result = result
    }
    var imageUrl: URL? {
        return URL(string: result.imageUrl)
    }
    var title: String?{
        return result.title
    }
    var id: String?{
        return result.id
    }
    var name: String?{
        return result.name
    }
}
