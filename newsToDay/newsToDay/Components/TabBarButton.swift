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
            Image(systemName: iconName)
                .resizable()
                .bold()
                .scaledToFit()
                .frame(width: 30, height: 30)
        }
        .foregroundStyle(selectedTab == tab ? .purplePrimary : .gray)
    }
}
