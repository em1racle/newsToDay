//
//  TabBarButton.swift
//  newsToDay
//
//  Created by Emir Byashimov on 25.10.2024.
//

import SwiftUI

struct TabBarButton: View {
    
    @Binding var selectedTab: Tab
    let tab: Tab
    let iconName: String

    
    var body: some View {
        Button(action: {
                    selectedTab = tab
                }) {
            Image(iconName)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                //.foregroundColor(selectedTab == tab ? .blue : .gray) // Выделение выбранной вкладки
        }
    }
}
//#Preview {
//    TabBarButton(iconName: "estate1", tab: .home, selectedTab: $selectedTab)
//}
