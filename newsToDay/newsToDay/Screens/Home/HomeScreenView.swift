//
//  HomeScreenView.swift
//  newsToDay
//
//  Created by Иван Семикин on 21/10/2024.
//

import SwiftUI

struct HomeScreenView: View {
    @Environment(AppRouter.self) private var appRouter
    @StateObject private var viewModel = HomeScreenViewModel()
    
//    @State private var selectedTab: Tab = .home
    @State private var searchText = ""
    @State private var selectedCategory: Category = .sports
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
            VStack {
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
                    .navigationTitle(LocalizedStringKey("Browse"))
                    .padding([.horizontal, .bottom])
                    .customAlert(isPresented: $showAlert, message: viewModel.errorMessage ?? "")
                    .onReceive(viewModel.errorMessagePublisher) { errorMessage in
                        showAlert = errorMessage != nil
                    }
                }
                VStack {
                    //Spacer()
                                        
                    CustomTabBarView()
                        .ignoresSafeArea(edges: .bottom)
                }
                .ignoresSafeArea()
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            viewModel.fetchTopHeadlines(for: selectedCategory.rawValue)
        }
    }
}

#Preview {
    HomeScreenView()
        .environment(AppRouter())
}
