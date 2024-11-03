//
//  BookmarksView.swift
//  newsToDay
//
//  Created by Иван Семикин on 26.10.24.
//

import SwiftUI

struct BookmarksView: View {
    @EnvironmentObject private var bookmarksManager: BookmarksManager
    
    @State private var selectedTab: Tab = .bookmark
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Bookmarks")
                .font(.system(size: 24, weight: .bold))
                .padding(.top, 20)
                .padding(.leading, 20)
            
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
        }
    }
}
#Preview {
    BookmarksView()
        .environmentObject(BookmarksManager())
}
