//
//  newsToDayApp.swift
//  newsToDay
//
//  Created by Emir Byashimov on 20.10.2024.
//

import SwiftUI

@main
struct newsToDayApp: App {
    
    @State private var appRouter = AppRouter()
    @State private var languageManager = LanguageManager()
    
    var body: some Scene {
        WindowGroup {
            Group {
                OnboardingView()
            }
            .environment(appRouter) // Роутинг по экранам приложения
            .environment(languageManager) // Управление языком приложения
            .environment(\.locale, .init(identifier: languageManager.currentLanguage))
            .dynamicTypeSize(.large)
        }
    }
}
