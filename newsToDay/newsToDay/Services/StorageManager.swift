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
        static let savedBookmark = "savedBookmarks"
    }
    private init() {}
    
    func saveUsername(_ username: String) {
           userDefaults.set(username, forKey: UserDefaultKeys.savedUsername)
       }

       func getUsername() -> String? {
           userDefaults.string(forKey: UserDefaultKeys.savedUsername)
       }
       
       func isUsernameTaken(_ username: String) -> Bool {
           return getUsername() == username
       }
   }
