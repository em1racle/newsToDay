//
//  LanguageView.swift
//  newsToDay
//
//  Created by Emir Byashimov on 24.10.2024.
//

import SwiftUI

struct LanguageView: View {
    
    @Environment(AppRouter.self) private var appRouter
    @Environment(\.presentationMode) var presentationMode
    @Environment(LanguageManager.self) var languageManager

    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 28) {
                MainButton(
                    buttonText: "English",
                    isSelected: languageManager.currentLanguage == "en",
                    action: {
                        languageManager.currentLanguage = "en"
                    }
                )
                
                MainButton(
                    buttonText: "Русский",
                    isSelected: languageManager.currentLanguage == "ru",
                    action: {
                        languageManager.currentLanguage = "ru"
                    }
                )
            }
            .padding(.bottom, 560)
            .padding(20)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "arrow.backward")
                            .foregroundColor(.gray)
                            .font(.title3.weight(.medium))
                        
                    }
                }
                
                ToolbarItem(placement: .principal) {
                    Text(LocalizedStringKey("Language"))
                        .font(.headline)
                        .frame(height: 24)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    LanguageView()
        .environment(AppRouter())
        .environment(LanguageManager())
}


