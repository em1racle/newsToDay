//
//  StorageManager.swift
//  newsToDay
//
//  Created by Emir Byashimov on 02.11.2024.
//

import Foundation

final class StorageManager {
    public static let shared = StorageManager()
    private let userDefaults = UserDefaults.standard
    
    enum UserDefaultKeys {
        static let savedUsername = "savedUsername"
        static let savedBookmarks = "savedBookmarks"
    }
    private init() {}
    
    // MARK: - Username Management
    func saveUsername(_ username: String) {
        userDefaults.set(username, forKey: UserDefaultKeys.savedUsername)
    }
    
    func getUsername() -> String? {
        userDefaults.string(forKey: UserDefaultKeys.savedUsername)
    }
    
    func isUsernameTaken(_ username: String) -> Bool {
        return getUsername() == username
    }
    
    // MARK: - Bookmarks Management
    func saveBookmarks(_ bookmarks: [Article]) {
        do {
            let data = try JSONEncoder().encode(bookmarks)
            userDefaults.set(data, forKey: UserDefaultKeys.savedBookmarks)
        } catch {
            print("Failed to encode bookmarks: \(error)")
        }
    }
    
    func loadBookmarks() -> [Article] {
        guard let data = userDefaults.data(forKey: UserDefaultKeys.savedBookmarks) else { return [] }
        
        do {
            return try JSONDecoder().decode([Article].self, from: data)
        } catch {
            print("Failed to decode bookmarks: \(error)")
            return []
        }
    }
}
