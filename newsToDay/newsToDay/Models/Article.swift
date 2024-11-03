//
//  Article.swift
//  newsToDay
//
//  Created by Иван Семикин on 22/10/2024.
//

import Foundation

struct NewsResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

struct Article: Codable, Identifiable, Hashable {
    enum CodingKeys: String, CodingKey {
        case source, author, title, description, url, urlToImage, publishedAt, content, category
    }
    
    let id = UUID()
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
    var category: String? = nil
    
    init(source: Source, author: String?, title: String, description: String?, url: String, urlToImage: String?, publishedAt: String, content: String?, category: String? = nil) {
        self.source = source
        self.author = author
        self.title = title
        self.description = description
        self.url = url
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
        self.content = content
        self.category = category
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        source = try container.decode(Source.self, forKey: .source)
        author = try container.decodeIfPresent(String.self, forKey: .author)
        title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        description = try container.decodeIfPresent(String.self, forKey: .description)
        url = try container.decodeIfPresent(String.self, forKey: .url) ?? ""
        urlToImage = try container.decodeIfPresent(String.self, forKey: .urlToImage)
        publishedAt = try container.decodeIfPresent(String.self, forKey: .publishedAt) ?? ""
        content = try container.decodeIfPresent(String.self, forKey: .content)
        category = try container.decodeIfPresent(String.self, forKey: .category)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(source, forKey: .source)
        try container.encodeIfPresent(author, forKey: .author)
        try container.encode(title, forKey: .title)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encode(url, forKey: .url)
        try container.encodeIfPresent(urlToImage, forKey: .urlToImage)
        try container.encodeIfPresent(publishedAt, forKey: .publishedAt)
        try container.encodeIfPresent(content, forKey: .content)
        try container.encodeIfPresent(category, forKey: .category)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(url)
    }
    
    static func == (lhs: Article, rhs: Article) -> Bool {
        lhs.url == rhs.url
    }
}

struct Source: Codable, Hashable {
    let id: String?
    let name: String
}
