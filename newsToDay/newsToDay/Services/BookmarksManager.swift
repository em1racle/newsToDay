//
//  BookmarksManager.swift
//  newsToDay
//
//  Created by Иван Семикин on 27/10/2024.
//

import Foundation

final class BookmarksManager: ObservableObject {
    @Published var bookmarkedArticles: [Article] = []
    
    init() {
        loadBookmarks()
    }
    
    func toggleBookmark(for article: Article, category: String = "") {
        if let index = bookmarkedArticles.firstIndex(of: article) {
            bookmarkedArticles.remove(at: index)
        } else {
            var articleWithCategory = article
            articleWithCategory.category = category
            bookmarkedArticles.append(articleWithCategory)
        }
        saveBookmarks()
    }
    
    func isBookmarked(for article: Article) -> Bool {
        bookmarkedArticles.contains(article)
    }
    
    private func saveBookmarks() {
        StorageManager.shared.saveBookmarks(bookmarkedArticles)
    }
    
    private func loadBookmarks() {
        bookmarkedArticles = StorageManager.shared.loadBookmarks()
    }
}
