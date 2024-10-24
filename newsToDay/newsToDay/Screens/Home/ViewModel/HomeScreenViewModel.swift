//
//  HomeScreenViewModel.swift
//  newsToDay
//
//  Created by Иван Семикин on 24/10/2024.
//

import Foundation
import Combine

final class HomeScreenViewModel: ObservableObject {
    @Published var articles: [Article] = []
    @Published var errorMessage: String?
    
    private var cancellables = Set<AnyCancellable>()
    private var apiClient = APIClient()
}
