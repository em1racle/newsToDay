//
//  NewsDescriptionView.swift
//  newsToDay
//
//  Created by Иван Семикин on 03/11/24.
//

import SwiftUI

struct NewsDescriptionView: View {
    @EnvironmentObject var bookmarkManager: BookmarksManager
    @ObservedObject private var vm: NewsDescriptionViewModel
    
    @Environment(\.presentationMode) var presentationMode
    
    let category: String
    
    // Инициализатор в самом View
    init(article: Article, category: String) {
        self.vm = NewsDescriptionViewModel(article: article)
        self.category = category
    }
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    ZStack {
                        ImageNewsView(imageUrl: vm.imageUrl)
                        
                        SourceAndTitleNewsView(article: vm.article, category: category)
                    }
                    
                    DescriptionNewsView(article: vm.article)
                }
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            }
            
            VStack {
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .bold()
                            .padding(10)
                            .background(Color.purplePrimary)
                            .clipShape(Circle())
                            .foregroundStyle(.white)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        bookmarkManager.toggleBookmark(for: vm.article)
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: bookmarkManager.isBookmarked(for: vm.article) ? "bookmark.fill" : "bookmark")
                            .font(.title2)
                            .padding(10)
                            .background(Color.purplePrimary)
                            .clipShape(Circle())
                            .foregroundStyle(.white)
                    }
                }
                .padding(.horizontal)

                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width)
            .padding(.top, 60)
        }
        .ignoresSafeArea(edges: .top)
    }
}
