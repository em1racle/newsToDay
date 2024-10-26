//
//  NewsView.swift
//  newsToDay
//
//  Created by Иван Семикин on 22/10/2024.
//

import SwiftUI

struct NewsView: View {
    let articles: [Article]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 16) {
                ForEach(articles) { article in
                    NavigationLink(destination: Text("Detail of news")) {
                        NewsArticleCardView(
                            article: article,
                            cardSize: UIScreen.main.bounds.width * 0.75
                        )
                    }
                }
            }
            .padding()
        }
        .frame(height: UIScreen.main.bounds.width * 0.75)
    }
}

//MARK: - NewsArticleCardView
struct NewsArticleCardView: View {
    let article: Article
    let cardSize: CGFloat
    
    var body: some View {
        ZStack {
            NewsImageView(urlToImage: article.urlToImage, cardSize: cardSize)
            
            LinearGradient(
                gradient: Gradient(colors: [.black.opacity(0.8), .clear]),
                startPoint: .bottom,
                endPoint: .top
            )
            .frame(width: cardSize, height: cardSize)
            .cornerRadius(12)
            
            NewsArticleContentView(article: article)
                .padding(24)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(width: cardSize, height: cardSize)
        .clipShape(.rect(cornerRadius: 12))
    }
}

//MARK: NewsImageView
struct NewsImageView: View {
    let urlToImage: String?
    let cardSize: CGFloat
    
    var body: some View {
        if let urlToImage = urlToImage, let url = URL(string: urlToImage) {
            AsyncImage(url: url) { image in
                image
                    .image?.resizable()
                    .scaledToFill()
                    .frame(width: cardSize, height: cardSize)
            }
        } else {
            Image(.imageNotFound)
                .resizable()
                .aspectRatio(1.0, contentMode: .fit)
        }
    }
}

//MARK: - NewsArticleContentView
struct NewsArticleContentView: View {
    let article: Article
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Spacer()
                Image(systemName: "bookmark")
                    .font(.system(size: 24))
                    .bold()
                    .foregroundStyle(.white)
            }
            
            Spacer()
            
            Text(article.source.name.uppercased())
                .font(.system(size: 12))
                .foregroundStyle(.white)
                .multilineTextAlignment(.leading)
                .lineLimit(1)
            
            Text(article.title)
                .font(.system(size: 16))
                .foregroundStyle(.white)
                .bold()
                .multilineTextAlignment(.leading)
                .lineLimit(2)
        }
    }
}
