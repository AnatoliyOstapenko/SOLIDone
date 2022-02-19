//
//  DataFetcherService.swift
//  SOLIDone
//
//  Created by MacBook on 16.02.2022.
//

import Foundation

class DataFetcherService {
    
    // set var to initialize NetworkService class via protocol
    // it's not working in UIViewController
    var networkFetcher: Datafetcher
    var localFetcher: Datafetcher
    init(dataFetcher: Datafetcher = NetworkDataFetcher(), localFetcher: Datafetcher = LocalDataFetcher()) {
        self.networkFetcher = dataFetcher
        self.localFetcher = localFetcher
    }

  
    // Networking
    func fetchNews(completion: @escaping (NewsAPI?) -> Void) {
        networkFetcher.fetchGenericJSONData(Password.url, completion: completion)
    }
    func fetchAppleApps(completion: @escaping (AppleRssAPI?) -> Void) {
        networkFetcher.fetchGenericJSONData(Password.appleApps, completion: completion)
    }
    func fetchAppleBooks(completion: @escaping (AppleRssAPI?) -> Void) {
        networkFetcher.fetchGenericJSONData(Password.appleBooks, completion: completion)
    }
    // Local working
    func fetchLocalData(completion: @escaping (NewsAPI?) -> Void) {
        localFetcher.fetchGenericJSONData("localData.txt", completion: completion)
    }
}
