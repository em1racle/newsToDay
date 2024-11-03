//
//  BookmarksView.swift
//  newsToDay
//
//  Created by Никита Мартьянов on 23.10.24.
//

import SwiftUI

struct BookmarksView: View {
    @EnvironmentObject private var bookmarksManager: BookmarksManager
    
    var body: some View {
        NavigationView {
            Group {
                if bookmarksManager.bookmarkedArticles.isEmpty {
                    EmptyBookmarksListView()
                } else {
                    ScrollView {
                        VStack(alignment: .leading) {
                            Text(LocalizedStringKey("Saved articles to the library"))
                                .foregroundStyle(.secondary)
                            
                            HorizontalNewsView(articles: Array(bookmarksManager.bookmarkedArticles))
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
            .navigationTitle(LocalizedStringKey("Bookmarks"))
        }
    }
}
