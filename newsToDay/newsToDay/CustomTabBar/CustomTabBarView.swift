//
//  SwiftUIView.swift
//  newsToDay
//
//  Created by Emir Byashimov on 25.10.2024.
//

import SwiftUI

struct CustomTabBarView: View {
    
    @Binding var selectedTab: Tab

    
    @Environment(AppRouter.self) private var appRouter
    
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
                TabBarButton(selectedTab: $selectedTab, tab: .home, iconName: "estate1")
                TabBarButton(selectedTab: $selectedTab, tab: .home, iconName: "apps1")
                TabBarButton(selectedTab: $selectedTab, tab: .bookmark, iconName: "bookmark1")
                TabBarButton(selectedTab: $selectedTab, tab: .profile, iconName: "user1")
            }
            .frame(alignment: .center)
        }
        .frame(height: 96)
    }
}

//#Preview {
//    CustomTabBarView()
//        .environment(AppRouter())
//}
