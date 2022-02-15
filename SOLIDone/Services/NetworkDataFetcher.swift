//
//  NetworkDataFetcher.swift
//  SOLIDone
//
//  Created by MacBook on 15.02.2022.
//

import Foundation

class NetworkDataFetcher {
    
    // External dependencies
    var networkService = NetworkService()
    
    func fetchData(completion: @escaping (NewsAPI?) -> Void) {
        networkService.requestData { (data, error) in
            let decoder = JSONDecoder()
            guard error == nil, let data = data else { return }
            
            let response = try? decoder.decode(NewsAPI.self, from: data)
            completion(response)
        }
    }
}
