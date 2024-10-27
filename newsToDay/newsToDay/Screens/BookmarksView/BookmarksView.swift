//
//  BookmarksView.swift
//  newsToDay
//
//  Created by Никита Мартьянов on 23.10.24.
//

import SwiftUI

struct BookmarksView: View {
    @StateObject private var viewModel = HomeScreenViewModel()
    
    // TODO: Set articles from bookmarks
    var articles: [Article]
    
    var body: some View {
        NavigationView {
            Group {
                if articles.isEmpty {
                    EmptyBookmarksListView()
                } else {
                    ScrollView {
                        VStack(alignment: .leading) {
                            Text(LocalizedStringKey("Saved articles to the library"))
                                .foregroundStyle(.secondary)
                            
                            HorizontalNewsView(articles: articles)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
            .navigationTitle(LocalizedStringKey("Bookmarks"))
        }
        .onAppear {
            viewModel.fetchTopHeadlines(for: Category.business.rawValue)
        }
    }
}
