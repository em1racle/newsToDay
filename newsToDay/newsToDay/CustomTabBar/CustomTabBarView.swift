//
//  SwiftUIView.swift
//  newsToDay
//
//  Created by Emir Byashimov on 25.10.2024.
//

import SwiftUI

struct CustomTabBarView: View {
    
    @Environment(AppRouter.self) private var appRouter
    
    var body: some View {
    
        ZStack {
            // Серый прямоугольник
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(Color.white) // Установите нужный цвет и прозрачность
                .frame(height: 110) // Задайте нужную высоту
                .overlay(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .stroke(Color.greyLight, lineWidth: 1) // Цвет и ширина границы
                        )
            
            // Ваш HStack для кнопок таб-бара
            HStack(alignment: .center, spacing: 64) {
                TabBarButton(iconName: "estate1") {
                    appRouter.appRoute.append(.home)
                }
                TabBarButton(iconName: "apps1") {
                    appRouter.appRoute.append(.home)
                }
                TabBarButton(iconName: "bookmark1") {
                    appRouter.appRoute.append(.bookmark)
                }
                TabBarButton(iconName: "user1") {
                    appRouter.appRoute.append(.profile)
                }
            }
            .frame(alignment: .center)
        }
        .frame(height: 96) // Совпадает с высотой прямоугольника для компоновки
    }
}

//#Preview {
//    CustomTabBarView(selectedTab: )
//}
