//
//  LocalDataFetcher.swift
//  SOLIDone
//
//  Created by MacBook on 19.02.2022.
//

import Foundation

class LocalDataFetcher: NetworkDataFetcher {
    override func fetchGenericJSONData<T>(_ url: String, completion: @escaping (T?) -> Void) where T : Decodable {
        guard let file = Bundle.main.url(forResource: url, withExtension: nil) else { return }
        
        let data = try? Data(contentsOf: file) // Check is a file available on local disk
        let decoded = self.parsingJSON(T.self, data)
        completion(decoded)
    }
}
