//
//  HomeScreenViewModel.swift
//  newsToDay
//
//  Created by Иван Семикин on 24/10/2024.
//

import Foundation

final class HomeScreenViewModel: ObservableObject {
    @Published var articles: [Article] = []
    @Published var errorMessage: String?
    
    private var apiClient = APIClient()
    
    func fetchTopHeadlines(for category: String) {
        apiClient.fetchTopHeadlines(category: category) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let articles):
                    self?.articles = articles
                    self?.errorMessage = nil
                case .failure(let error):
                    self?.articles = []
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    func searchNews(query: String) {
        apiClient.searchNews(query: query) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let articles):
                    self?.articles = articles
                    self?.errorMessage = nil
                case .failure(let error):
                    self?.articles = []
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
