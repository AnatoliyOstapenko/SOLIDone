//
//  NetworkService.swift
//  SOLIDone
//
//  Created by MacBook on 13.02.2022.
//

import Foundation

class NetworkService {

    func requestData(completion: @escaping(Data?, Error?) -> Void) {
        guard let url = URL(string: Password.url) else { return }
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
        task.resume()
    }
    
    
    
    
    
    
}
