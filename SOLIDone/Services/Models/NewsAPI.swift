//
//  NewsAPI.swift
//  SOLIDone
//
//  Created by MacBook on 13.02.2022.
//

import Foundation

struct NewsAPI: Decodable {
    let articles: [Articles]
}

struct Articles: Decodable {
    let source: Source
    let title: String
    let url: String
    let urlToImage: String?
}

struct Source: Decodable {
    let name: String
}
