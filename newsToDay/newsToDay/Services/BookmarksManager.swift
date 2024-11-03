//
//  BookmarksManager.swift
//  newsToDay
//
//  Created by Иван Семикин on 27/10/2024.
//

import Foundation

final class BookmarksManager: ObservableObject {
    @Published var bookmarkedArticles: Set<Article> = []
    
    init() {
        loadBookmakrs()
    }
    
    func toggleBookmark(for article: Article) {
        if bookmarkedArticles.contains(article) {
            bookmarkedArticles.remove(article)
            print(bookmarkedArticles.count)
        } else {
            bookmarkedArticles.insert(article)
            print("Article added: \(article). Current bookmarks: \(bookmarkedArticles)")
        }
        saveBookmarks()
    }
    
    func isBookmarked(for article: Article) -> Bool {
        bookmarkedArticles.contains(article)
    }
    
    private func saveBookmarks() {
        let bookmarksArray = Array(bookmarkedArticles)
        StorageManager.shared.saveBookmarks(bookmarksArray)
    }
    
    private func loadBookmakrs() {
        let bookmarksArray = StorageManager.shared.loadBookmarks()
        bookmarkedArticles = Set(bookmarksArray)
    }
}
