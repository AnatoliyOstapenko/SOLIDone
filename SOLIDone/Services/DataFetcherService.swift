//
//  DataFetcherService.swift
//  SOLIDone
//
//  Created by MacBook on 16.02.2022.
//

import Foundation

class DataFetcherService {
    
    var networkDataFetcher: NetworkDataFetcher!
    
    // It's fckng magic way to initialize NetworkDataFetcher, why? nobody pesponse(
    init(networkDataFetcher: NetworkDataFetcher = NetworkDataFetcher()) {
        self.networkDataFetcher = networkDataFetcher
    }
  
    // FckMagic
    func fetchNews(completion: @escaping (NewsAPI?) -> Void) {
        networkDataFetcher.fetchGenericJSONData(Password.url, completion: completion)
    }
    func fetchAppleApps(completion: @escaping (AppleRssAPI?) -> Void) {
        networkDataFetcher.fetchGenericJSONData(Password.appleApps, completion: completion)
    }
    func fetchAppleBooks(completion: @escaping (AppleRssAPI?) -> Void) {
        networkDataFetcher.fetchGenericJSONData(Password.appleBooks, completion: completion)
    }
}
