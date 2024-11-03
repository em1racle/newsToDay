//
//  BookmarksManager.swift
//  newsToDay
//
//  Created by Иван Семикин on 27/10/2024.
//

import Foundation

final class BookmarksManager: ObservableObject {
    @Published var bookmarkedArticles: Set<Article> = []
    
    func toggleBookmark(for article: Article) {
        if bookmarkedArticles.contains(article) {
            bookmarkedArticles.remove(article)
            print(bookmarkedArticles)
        } else {
            bookmarkedArticles.insert(article)
            print("Article added: \(article). Current bookmarks: \(bookmarkedArticles)")
        }
    }
    
    func isBookmarked(for article: Article) -> Bool {
        bookmarkedArticles.contains(article)
    }
}
