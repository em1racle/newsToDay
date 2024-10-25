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
                                Image(.testImageOfNews)
                                    .resizable()
                            }
                            .frame(height: 384)
                            .cornerRadius(10)
                        } else {
                            Image(.imageNotFound)
                                .resizable()
                                .frame(height: 384)
                                .frame(maxHeight: .infinity)
                                .cornerRadius(10)
                        }
                        
                        VStack(alignment: .leading) {
//                            Text("category")
//                                .foregroundStyle(.white)
                            RoundedRectangle(cornerRadius: 15)
                                .frame(width: 75, height: 32)
                                .foregroundStyle(.blackLight)
                            
                            Text(article.title)
                                .frame(width: 336, alignment: .leading)
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                                .padding(.top)
                                
                            
                            Text(article.author ?? "")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                                .padding(.top)
                            
                            Text("Author")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundStyle(.gray)
                                
                               
                                
                        }
                    }
                    Text("Result")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
                        .frame(width: 336)
                        .cornerRadius(10)
                        .padding(.top)
                       
                    
                    Text(article.description ?? "No description available.")
                        .font(.body)
                        .frame(width: 336)
                        .padding(.top)
                }
               
                .toolbar() {
                    ToolbarItem(placement: .topBarLeading) {
                        NavigationLink(destination: OnboardingView()) {
                            Image("user1")
                                .renderingMode(.template)
                                .foregroundStyle(.white)
                        }
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink(destination: OnboardingView()) {
                            Image(.bookmark1)
                                .renderingMode(.template)
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
