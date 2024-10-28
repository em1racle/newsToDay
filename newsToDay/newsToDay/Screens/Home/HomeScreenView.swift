//
//  HomeScreenView.swift
//  newsToDay
//
//  Created by Иван Семикин on 21/10/2024.
//

import SwiftUI

struct HomeScreenView: View {
    @StateObject private var viewModel = HomeScreenViewModel()
    @StateObject private var bookmarkManager = BookmarksManager()

    @State private var selectedTab: Tab = .home
    @State private var searchText = ""
    @State private var selectedCategory: Category = .sports
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
            VStack {
                switch selectedTab {
                    case .home:
                        ScrollView(.vertical) {
                            VStack(alignment: .leading, spacing: 16) {
                                Text(LocalizedStringKey("Discover things of this world"))
                                    .foregroundStyle(.secondary)
                                
                                SearchView(searchText: $searchText)
                                    .onChange(of: searchText) { _, newValue in
                                        viewModel.searchNews(query: searchText)
                                    }
                                
                                CategoriesView(selectedCategory: $selectedCategory)
                                    .onChange(of: selectedCategory) { _, _ in
                                        viewModel.fetchTopHeadlines(for: selectedCategory.rawValue)
                                    }
                                
                                NewsView(articles: viewModel.articles)
                            }
                            .padding([.horizontal, .bottom])
                        }
                        .navigationTitle(LocalizedStringKey("Browse"))
                    
                    case .categories:
                        LanguageView()
                            .navigationTitle(LocalizedStringKey("Categories"))
                    
                    case .bookmark:
                        BookmarksView()
                            .navigationTitle(LocalizedStringKey("Bookmarks"))
                    
                    case .profile:
                        ProfileView()
                            .navigationTitle(LocalizedStringKey("Profile"))
                }
                
                CustomTabBarView(selectedTab: $selectedTab)
            }
            .ignoresSafeArea(edges: .bottom)
            .customAlert(isPresented: $showAlert, message: viewModel.errorMessage ?? "")
            .onReceive(viewModel.errorMessagePublisher) { errorMessage in
                showAlert = errorMessage != nil
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            viewModel.fetchTopHeadlines(for: selectedCategory.rawValue)
        }
        .environmentObject(bookmarkManager)
    }
}

#Preview {
    HomeScreenView()
        .environment(AppRouter())
}
