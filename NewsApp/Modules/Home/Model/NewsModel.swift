//
//  NewsModel.swift
//  NewsApp
//
//  Created by Mahmoud Ismail on 7/15/21.
//

import Foundation


// MARK: - News
struct News: Codable {
    let status: String?
    let articles: [Article]?
    let totalResults: Int?
}

// MARK: - Article
struct Article: Codable {
    let source: Source?
    let author: String?
    let title, articleDescription: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?

    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }
}


// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String?
}


