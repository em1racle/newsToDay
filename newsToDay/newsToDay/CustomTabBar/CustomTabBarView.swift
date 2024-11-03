//
//  SwiftUIView.swift
//  newsToDay
//
//  Created by Emir Byashimov on 25.10.2024.
//

import SwiftUI

struct CustomTabBarView: View {
    
    @Binding var selectedTab: Tab

    var body: some View {
    
        ZStack {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(Color.white)
                .frame(height: 110)
                .overlay(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .stroke(Color.greyLight, lineWidth: 1)
                        )
            
            HStack(alignment: .center, spacing: 64) {
                TabBarButton(selectedTab: $selectedTab, tab: .home, iconName: "house")
                
                // TODO: Need to create this screen, don't leave it as empty.
//                TabBarButton(selectedTab: $selectedTab, tab: .home, iconName: "apps1")
                
                TabBarButton(selectedTab: $selectedTab, tab: .bookmark, iconName: "bookmark")
                TabBarButton(selectedTab: $selectedTab, tab: .profile, iconName: "person")
            }
            .padding(.bottom)
        }
        .frame(height: 96)
    }
}

//#Preview {
//    CustomTabBarView(selectedTab: $selectedTab)
//}
