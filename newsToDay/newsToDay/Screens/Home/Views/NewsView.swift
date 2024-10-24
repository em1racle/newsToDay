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
                    NavigationLink {
                        Text("Detail of news")
                    } label: {
                        ZStack {
                            if let urlToImage = article.urlToImage, let url = URL(string: urlToImage) {
                                AsyncImage(url: url) { image in
                                    image
                                        .image?.resizable()
                                        .scaledToFill()
                                        .frame(width: UIScreen.main.bounds.width * 0.75, height: UIScreen.main.bounds.width * 0.75)
                                        .clipShape(.rect(cornerRadius: 12))
                                }
                            } else {
                                Image(.imageNotFound)
                                    .resizable()
                                    .aspectRatio(1.0, contentMode: .fit)
                                    .clipShape(.rect(cornerRadius: 12))
                            }
                            
                            Color.black.opacity(0.3)
                                .clipShape(.rect(cornerRadius: 12))
                            
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
                                
                                Text(article.title)
                                    .font(.system(size: 16))
                                    .foregroundStyle(.white)
                                    .bold()
                                    .multilineTextAlignment(.leading)
                            }
                            .padding(24)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.75, height: UIScreen.main.bounds.width * 0.75)
                    }
                }
            }
            .padding()
        }
        .frame(height: UIScreen.main.bounds.width * 0.75)
    }
}
