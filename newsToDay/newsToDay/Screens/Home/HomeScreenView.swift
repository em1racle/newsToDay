//
//  HomeScreenView.swift
//  newsToDay
//
//  Created by Иван Семикин on 21/10/2024.
//

import SwiftUI

struct HomeScreenView: View {
    @StateObject private var viewModel = HomeScreenViewModel()
    
    @State private var searchText = ""
    @State private var selectedCategory: Category = .sports
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Discover things of this world")
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
                .navigationTitle("Browse")
                .padding([.horizontal, .bottom])
                .customAlert(isPresented: $showAlert, message: viewModel.errorMessage ?? "")
                .onReceive(viewModel.errorMessagePublisher) { errorMessage in
                    showAlert = errorMessage != nil
                }
            }
        }
        .onAppear {
            viewModel.fetchTopHeadlines(for: selectedCategory.rawValue)
        }
    }
}

#Preview {
    HomeScreenView()
}
