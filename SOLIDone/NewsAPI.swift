//
//  NewsAPI.swift
//  SOLIDone
//
//  Created by MacBook on 13.02.2022.
//

import Foundation

struct NewsAPI: Decodable {
    var articles: [Articles]
}

struct Articles: Decodable {
    var source: Source
    var title: String
    var url: String
    var urlToImage: String?
}

struct Source: Decodable {
    var name: String
}
