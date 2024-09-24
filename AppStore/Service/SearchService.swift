//
//  SearchService.swift
//  AppStore
//
//  Created by Zahra Alizada on 24.09.24.
//

import Foundation
import Alamofire

struct SearchService {
    static func fetchData(searchtext term: String, completion: @escaping([Result])->Void) {
        let baseUrl = "https://itunes.apple.com/search"
        let parameters = ["entity":"software", "term":term]
        
        
        AF.request(baseUrl,method: .get, parameters: parameters).responseData { responseData in
            if let error = responseData.error {
                print(error.localizedDescription)
                return
            }
            guard let data = responseData.data else { return }
            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                completion(searchResult.results)
            } catch {
                print(error.localizedDescription)
            }
            
        }
        
    }
}
