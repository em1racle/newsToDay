//
//  NewsDescriptionView.swift
//  newsToDay
//
//  Created by Sergey Zakurakin on 10/23/24.
//

import SwiftUI

struct NewsDescriptionView: View {
    let article: Article
    
    var body: some View {
        NavigationView{
            ScrollView {
                VStack {
                    ZStack {
                        if let urlToImage = article.urlToImage, let url = URL(string: urlToImage) {
                            AsyncImage(url: url) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 384)
                                 
                                 
                            } placeholder: {
                                Color.gray
                            }
                            .frame(height: 384)
                            .cornerRadius(10)
                        } else {
                            Image(.imageNotFound)
                                .resizable()
                                .frame(height: 384)
                                .cornerRadius(10)
                        }
                        
                        Text("fdsfsd")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                    }
                    Spacer()
                    Text(article.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
                        .frame(width: 300)
                        .cornerRadius(10)
                        .padding()
                    
                    Text(article.description ?? "No description available.")
                        .font(.body)
                        .frame(width: 300)
                }
                
               
                .toolbar() {
                    ToolbarItem(placement: .topBarLeading) {
                        NavigationLink(destination: OnboardingView()) {
                            Image("user1")
                                .foregroundStyle(.white)
                        }
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink(destination: OnboardingView()) {
                            Image("user1")
                                .foregroundStyle(.white)
                        }
                    }
                }
            }
            .ignoresSafeArea()
        }
    }
}
#Preview {
    NewsDescriptionView(article: Article(
        source: Source(id: nil, name: "Sample News Source"),
        author: "John Doe",
        title: "Sample Title Sample Title Sample Title Sample Title",
        description: "Sample Title Sample Title Sample Title Sample Title.",
        url: "https://example.com",
        urlToImage: "sample-image.jpg",
        publishedAt: "2024",
        content: "This is the content of the sample article."
    ))
}
