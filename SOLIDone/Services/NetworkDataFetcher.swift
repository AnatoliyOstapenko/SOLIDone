//
//  NetworkDataFetcher.swift
//  SOLIDone
//
//  Created by MacBook on 15.02.2022.
//

import Foundation

// Add a protocol to avoid external dependencies
protocol Datafetcher {
    func fetchGenericJSONData<T: Decodable>(_ url: String, completion: @escaping (T?) -> Void)
}

class NetworkDataFetcher: Datafetcher {
    
    // set networking to initialize NetworkService class via protocol
    // it's not working in UIViewController
    var networking: Networking?
    init(networking: Networking = NetworkService()) {
        self.networking = networking
    }

    // Add generics to avoid funcion duplication
    func fetchGenericJSONData<T: Decodable>(_ url: String, completion: @escaping (T?) -> Void) {
        networking?.requestData(url) { (data, error) in
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
