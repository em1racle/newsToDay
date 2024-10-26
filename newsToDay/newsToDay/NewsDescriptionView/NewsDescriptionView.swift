//
//  NewsDescriptionView.swift
//  newsToDay
//
//  Created by Sergey Zakurakin on 10/23/24.
//

import SwiftUI

struct NewsDescriptionView: View {
    @ObservedObject private var vm: NewsDescriptionViewModel
    
    // Инициализатор в самом View
    init(article: Article) {
        self.vm = NewsDescriptionViewModel(article: article)
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ZStack {
                        if let url = vm.imageUrl {
                            AsyncImage(url: url) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 384)
                            } placeholder: {
                                Color.gray
                                
                            }
                            .frame(height: 384)
                            
                        } else {
                            Image(.imageNotFound)
                                .resizable()
                                .frame(height: 384)
                                .cornerRadius(10)
                        }
                        VStack(alignment: .leading) {
                            Spacer()
                            Text("category?")
                                .foregroundStyle(.white)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .background(.purplePrimary)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                            
                            Text(vm.article.title)
                                .frame(width: 336, alignment: .leading)
                                .font(.system(size: 26, weight: .bold))
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                                .padding(.top)
                                .lineLimit(3)
                                .minimumScaleFactor(0.5)
                            
                            Text(vm.article.author ?? "")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                                .padding(.top)
                            
                            Text("Author")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundStyle(.gray)
                                .padding(.bottom, 40)
                        }
                    }
                    
                    Text("Result")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
                        .frame(width: 336)
                        .cornerRadius(10)
                        .padding(.top)
                    
                    
                    Text(vm.article.description ?? "No description available.")
                        .font(.body)
                        .frame(width: 336)
                        .padding(.top)
                }
                
                .toolbar() {
//                    ToolbarItem(placement: .navigationBarLeading) {
//                        Button(action: {} )
//                        {
//                            Image(systemName: "arrow.left")
//                                .foregroundStyle(.white)
//                        }
//                    }
//                    
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink(destination: BookmarksView()) {
                            Image(.bookmark1)
                                .renderingMode(.template)
                                .foregroundStyle(.white)
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .ignoresSafeArea()
        }
    }
}
#Preview {
    NewsDescriptionView(article: Article(
        source: Source(id: nil, name: "Sample News Source"),
        author: "John Doe",
        title: "The latest situation in the presidential election",
        description: "Sample Title Sample Title Sample Title Sample Title.",
        url: "https://example.com",
        urlToImage: "sample-image.jpg",
        publishedAt: "2024",
        content: "This is the content of the sample article."
    ))
}
