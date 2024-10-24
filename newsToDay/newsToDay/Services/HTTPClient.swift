//
//  HTTPClient.swift
//  newsToDay
//
//  Created by Иван Семикин on 22/10/2024.
//

import Foundation

enum ApiKey: String {
    case key = "9800c79adda242c4aa71af835aafb580"
}

enum HTTPMethod: String {
    case GET
}

// MARK: - Errors
enum HTTPClientError: Error, LocalizedError {
    case badURL
    case badDataTask
    case badParametrSerialization
    case badDecode
    case deadApiKey
    
    var errorDescription: String? {
        switch self {
        case .badURL:
            return "Invalid URL."
        case .badDataTask:
            return "Request failed."
        case .badParametrSerialization:
            return "Invalid parameters."
        case .badDecode:
            return "Unable to decode data."
        case .deadApiKey:
            return "Change your API key."
        }
    }
}

protocol HTTPClient {
    var apiKey: ApiKey { get }
    var baseURL: String { get }
    var path: String { get }
    var endpoint: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var data: Data? { get }
    
    func request<T: Codable>(type: T.Type, completion: @escaping(Result<T, HTTPClientError>) -> Void)
}

extension HTTPClient {
    func request<T: Codable>(type: T.Type, completion: @escaping(Result<T, HTTPClientError>) -> Void) {
        guard let url = URL(string: baseURL + path + endpoint) else {
            completion(.failure(.badURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        request.cachePolicy = .reloadIgnoringLocalCacheData
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { (data, response, error) -> Void in
            if error != nil {
                completion(.failure(.badDataTask))
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                switch httpResponse.statusCode {
                case 402:
                    completion(.failure(.deadApiKey))
                default:
                    break
                }
            }
            
            guard let data = data else {
                completion(.failure(.badDataTask))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(type, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(.badDecode))
            }
        }
        
        dataTask.resume()
    }
}
