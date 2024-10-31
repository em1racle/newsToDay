//
//  newsToDayApp.swift
//  newsToDay
//
//  Created by Emir Byashimov on 20.10.2024.
//

import SwiftUI

@main
struct newsToDayApp: App {
    
    @State private var languageManager = LanguageManager()
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding: Bool = true // Флаг для онбординга

    var body: some Scene {
        WindowGroup {
            if hasSeenOnboarding {
                ContentView() // Показываем основной контент с таб-баром после онбординга
                    .environment(languageManager)
                    .environment(\.locale, .init(identifier: languageManager.currentLanguage))
                    .dynamicTypeSize(.large)
            } //else {
//                OnboardingView()
//                    .onDisappear { hasSeenOnboarding = true } // Устанавливаем флаг после завершения онбординга
//                    .environment(languageManager)
//                    .environment(\.locale, .init(identifier: languageManager.currentLanguage))
//            }
        }
    }
}

struct ContentView: View {
    @State private var selectedTab: Tab = .home

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                // Переключение между представлениями для каждой вкладки
                switch selectedTab {
                    case .home:
                    HomeScreenView()
                    
                    case .categories:
                        LanguageView()
                    
                    case .bookmark:
                        BookmarksView()
                    
                    case .profile:
                        ProfileView()
                }
                
                Spacer()
                
                CustomTabBarView(selectedTab: $selectedTab)
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}
