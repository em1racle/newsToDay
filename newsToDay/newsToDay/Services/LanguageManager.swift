//
//  LanguageManager.swift
//  newsToDay
//
//  Created by Emir Byashimov on 25.10.2024.
//

import Foundation
import Observation

@Observable
class LanguageManager {
    var currentLanguage: String {
        didSet {
            UserDefaults.standard.set(currentLanguage, forKey: "selectedLanguage")
        }
    }
    
    init() {
        self.currentLanguage = UserDefaults.standard.string(forKey: "selectedLanguage") ?? "en"
    }
}
