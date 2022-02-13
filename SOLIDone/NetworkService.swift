//
//  NetworkService.swift
//  SOLIDone
//
//  Created by MacBook on 13.02.2022.
//

import Foundation

class NetworkService {

    func requestData(completion: @escaping(Data?, Error?) -> Void) {
        guard let url = URL(string: K.apiKey) else { return }
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
        task.resume()
    }
    
    func fetchData() {
        requestData { (data, error) in
            let decoder = JSONDecoder()
            guard error == nil, let data = data else { return }
            
            let response = try? decoder.decode(NewsAPI.self, from: data)
            print(response as Any)
        }
    }
    
    
    
}
