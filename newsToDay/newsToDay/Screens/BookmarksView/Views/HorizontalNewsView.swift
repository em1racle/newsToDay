//
//  HorizontalNewsView.swift
//  newsToDay
//
//  Created by Иван Семикин on 26/10/2024.
//

import SwiftUI

struct HorizontalNewsView: View {
    let articles: [Article]

    var body: some View {
        ForEach(articles) { article in
            HStack(spacing: 16) {
                NavigationLink(destination: NewsDescriptionView(article: article, category: article.category ?? "")) {
                    NewsImageView(
                        urlToImage: article.urlToImage,
                        cardSize: UIScreen.main.bounds.width * 0.2
                    )
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(article.source.name.uppercased())
                            .font(.system(size: 12))
                            .foregroundColor(.secondary)
                            .lineLimit(1)
                        
                        Text(article.title)
                            .font(.system(size: 16))
                            .foregroundColor(.primary)
                            .bold()
                            .lineLimit(2)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding()
            .background(Color(UIColor.systemBackground))
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
        }
    }
}
