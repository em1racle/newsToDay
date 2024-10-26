//
//  NewsDescriptionViewModel.swift
//  newsToDay
//
//  Created by Sergey Zakurakin on 10/25/24.
//

import Foundation

final class NewsDescriptionViewModel: ObservableObject {
    
    @Published var article: Article
    
    init(article: Article) {
        self.article = article
    }
    
    var imageUrl: URL? {
        if let urlToImage = article.urlToImage {
            return URL(string: urlToImage)
        }
        return nil
    }
    
    var authorText: String {
        article.author ?? "Unknown Author"
    }
    
    var descriptionText: String {
        article.description ?? "No description available."
    }
}
