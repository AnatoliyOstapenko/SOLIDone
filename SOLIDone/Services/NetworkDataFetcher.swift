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
    
    func fetchNews(_ url: String, completion: @escaping (NewsAPI?) -> Void) {
        networkService.requestData(url) { (data, error) in
            let decoder = JSONDecoder()
            guard error == nil, let data = data else { return }
            
            let response = try? decoder.decode(NewsAPI.self, from: data)
            completion(response)
        }
        
//        { (data, error) in
//            let decoder = JSONDecoder()
//            guard error == nil, let data = data else { return }
//
//            let response = try? decoder.decode(NewsAPI.self, from: data)
//            completion(response)
//        }
        
        
    }
//    func fetchAppleRss(completion: @escaping (AppleRssAPI?) -> Void) {
//        networkService.requestData { (data, error) in
//            let decoder = JSONDecoder()
//            guard error == nil, let data = data else { return }
//
//            let response = try? decoder.decode(AppleRssAPI.self, from: data)
//            completion(response)
//        }
        
        
//    }
}
