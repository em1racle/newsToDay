//
//  HorizontalNewsView.swift
//  newsToDay
//
//  Created by Иван Семикин on 26/10/2024.
//

import SwiftUI

struct HorizontalNewsView: View {
    let article: Article

    var body: some View {
        HStack(spacing: 16) {
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
        .padding()
        .background(Color(UIColor.systemBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
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
