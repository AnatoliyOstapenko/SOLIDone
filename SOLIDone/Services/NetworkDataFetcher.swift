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
        
        
    }
    func fetchAppleRss(_ url: String, completion: @escaping (AppleRssAPI?) -> Void) {
        networkService.requestData(url) { (data, error) in
            let decoder = JSONDecoder()
            guard error == nil, let data = data else { return }

            let response = try? decoder.decode(AppleRssAPI.self, from: data)
            completion(response)
        }
        
        
    }
    func fetchAppleBooks(_ url: String, completion: @escaping (AppleRssAPI?) -> Void) {
        networkService.requestData(url) { (data, error) in
            let decoder = JSONDecoder()
            guard error == nil, let data = data else { return }

            let response = try? decoder.decode(AppleRssAPI.self, from: data)
            completion(response)
        }
        
        
    }
    
    // Add generics to avoid funcion duplication
    func fetchGenericJSONData<T: Decodable>(_ url: String, completion: @escaping (T?) -> Void) {
        networkService.requestData(url) { (data, error) in
            guard error == nil, let response = self.parsingJSON(T.self, data) else { return }
            completion(response)
        }
    }
    // Add parsing JSON to follow Open Closed Principle
    func parsingJSON<T: Decodable>(_ type: T.Type, _ data: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = data else { return nil }
        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch let error {
            print(error)
            return nil
            
        }
    }
}
