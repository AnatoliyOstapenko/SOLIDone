//
//  AppleRssAPI.swift
//  SOLIDone
//
//  Created by MacBook on 16.02.2022.
//

import Foundation

struct AppleRssAPI: Decodable {
    let feed: Feed
}
struct Feed: Decodable {
    let results: [Results]
}

struct Results: Decodable {
    let artistName: String
    let name: String
    let icon: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case artistName, name, url
        case icon = "artworkUrl100"
        
    }
}
