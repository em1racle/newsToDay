//
//  BookmarksManager.swift
//  newsToDay
//
//  Created by Иван Семикин on 27/10/2024.
//

import Foundation

final class BookmarksManager: ObservableObject {
    @Published var bookmarkedArticles: Set<Article> = []
    
    func toogleBookmark(for article: Article) {
        if bookmarkedArticles.contains(article) {
            bookmarkedArticles.remove(article)
        } else {
            bookmarkedArticles.insert(article)
        }
    }
    
    func isBookmarked(for article: Article) -> Bool {
        bookmarkedArticles.contains(article)
    }
}
