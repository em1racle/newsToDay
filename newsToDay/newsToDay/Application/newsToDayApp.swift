//
//  newsToDayApp.swift
//  newsToDay
//
//  Created by Emir Byashimov on 20.10.2024.
//

import SwiftUI
import Firebase

@main
struct newsToDayApp: App {
    
    @State private var languageManager = LanguageManager()
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding: Bool = false
    @AppStorage("isLoggedIn") private var isLoggedIn: Bool = false
    @StateObject private var viewModel = RegisterViewModel()

    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(languageManager)
                .environment(\.locale, .init(identifier: languageManager.currentLanguage))
                .environmentObject(viewModel)
                .environmentObject(BookmarksManager())
        }
    }
}

struct RootView: View {
    @AppStorage("isLoggedIn") private var isLoggedIn: Bool = false
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding: Bool = false
    
    var body: some View {
        if !isLoggedIn {
            RegistrationView(viewModel: RegisterViewModel())
        } else if !hasSeenOnboarding {
            OnboardingView()
        } else {
            ContentView()
        }
    }
}

struct ContentView: View {
    @State private var selectedTab: Tab = .home

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
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
        .navigationBarBackButtonHidden(true)
    }
}
