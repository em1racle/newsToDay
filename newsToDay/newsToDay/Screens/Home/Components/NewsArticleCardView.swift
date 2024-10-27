//
//  NewsArticleCardView.swift
//  newsToDay
//
//  Created by Иван Семикин on 27/10/2024.
//

import SwiftUI

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
            .clipShape(.rect(cornerRadius: 12))
            
            NewsArticleContentView(article: article)
                .padding(24)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(width: cardSize, height: cardSize)
    }
}

//MARK: NewsImageView
struct NewsImageView: View {
    let urlToImage: String?
    let cardSize: CGFloat
    
    var body: some View {
        if let urlToImage = urlToImage, let url = URL(string: urlToImage) {
            AsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    placeholderImage
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: cardSize, height: cardSize)
                        .clipShape(.rect(cornerRadius: 12))
                case .failure(_):
                    placeholderImage
                @unknown default:
                    placeholderImage
                }
            }
        } else {
            placeholderImage
        }
    }
    
    private var placeholderImage: some View {
        Image(.imageNotFound)
            .resizable()
            .scaledToFill()
            .frame(width: cardSize, height: cardSize)
            .clipShape(.rect(cornerRadius: 12))
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

