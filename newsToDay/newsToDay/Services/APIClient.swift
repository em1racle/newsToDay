//
//  APIClient.swift
//  newsToDay
//
//  Created by Иван Семикин on 22/10/2024.
//

import Foundation

final class APIClient: HTTPClient {
    var apiKey: ApiKey = .key
    var baseURL: String = "https://newsapi.org/v2"
    var path: String = ""
    var endpoint: String = ""
    var method: HTTPMethod = .GET
    
    var headers: [String: String]? {
        return ["Authorization": "Bearer \(apiKey.rawValue)"]
    }
    
    var data: Data? = nil
    
    func fetchTopHeadlines(category: String, completion: @escaping(Result<[Article], HTTPClientError>) -> Void) {
        path = "/top-headlines"
        endpoint = "?category=\(category)&apiKey=\(apiKey.rawValue)"
        request(type: NewsResponse.self) { result in
            switch result {
            case .success(let response):
                completion(.success(response.articles))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func searchNews(query: String, completion: @escaping(Result<[Article], HTTPClientError>) -> Void) {
        path = "/everything"
        endpoint = "?q=\(query)&apiKey=\(apiKey.rawValue)"
        request(type: NewsResponse.self) { result in
            switch result {
            case .success(let response):
                completion(.success(response.articles))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
