//
//  NewsView.swift
//  newsToDay
//
//  Created by Иван Семикин on 22/10/2024.
//

import SwiftUI

struct NewsView: View {
    let articles: [Article]
    let category: String
    
    let cardSize = UIScreen.main.bounds.width * 0.65
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 16) {
                ForEach(articles) { article in
                    NavigationLink(destination: NewsDescriptionView(article: article, category: category)) {
                        NewsArticleCardView(
                            article: article,
                            category: category,
                            cardSize: cardSize
                        )
                    }
                }
            }
            .padding()
        }
        .frame(height: cardSize)
    }
}
