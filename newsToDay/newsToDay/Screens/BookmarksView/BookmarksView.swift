//
//  BookmarksView.swift
//  newsToDay
//
//  Created by Никита Мартьянов on 23.10.24.
//

import SwiftUI

// Text(LocalizedStringKey("Bookmarks"))
// Text(LocalizedStringKey("Saved articles to the library"))
//Text(LocalizedStringKey("You haven't saved any articles yet. Start reading and bookmarking them now."))

struct BookmarksView: View {
    var articles: [Article]
    
    var body: some View {
        NavigationView {
            Group {
                if articles.isEmpty {
                    ZStack {
                        EmptyBookmarksListView()
                    }
                } else {
                    ScrollView {
                        VStack(alignment: .leading) {
                            Text(LocalizedStringKey("Saved articles to the library"))
                                .foregroundStyle(.secondary)
                            
                        // Show bookmarks' list
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

#Preview {
    let sampleArticles = [
        Article(
            source: Source(id: "example-source-1", name: "Пример источника 1"),
            author: "Автор 1",
            title: "Пример статьи 1",
            description: "Это описание первой примерной статьи.",
            url: "https://example.com/article1",
            urlToImage: "https://example.com/image1.jpg",
            publishedAt: "2023-10-01T12:00:00Z",
            content: "Это содержание первой примерной статьи."
        ),
        Article(
            source: Source(id: "example-source-2", name: "Пример источника 2"),
            author: "Автор 2",
            title: "Пример статьи 2",
            description: "Это описание второй примерной статьи.",
            url: "https://example.com/article2",
            urlToImage: "https://example.com/image2.jpg",
            publishedAt: "2023-10-02T12:00:00Z",
            content: "Это содержание второй примерной статьи."
        )
    ]
    BookmarksView(articles: sampleArticles)
}
