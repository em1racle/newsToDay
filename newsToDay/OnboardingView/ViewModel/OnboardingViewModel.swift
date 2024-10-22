//
//  OnboardingViewModel.swift
//  newsToDay
//
//  Created by Sergey Zakurakin on 10/22/24.
//

import SwiftUI

final class OnboardingViewModel: ObservableObject {
    
    @Published var currentIndex: Int = 0
    @Published var offset: CGSize = .zero
    
    let screenWidth = UIScreen.main.bounds.width
    let squares: [Color] = [.red, .green, .blue]
    
    // Вычисление смещения для каждого квадрата
    func getOffsetForSquare(at index: Int) -> CGFloat {
        let visiblePart: CGFloat = 40 // Смещение для частично видимых квадратов
        let baseOffset = CGFloat(index - currentIndex) * screenWidth * 0.8 // Смещение центрального квадрата
        return baseOffset + (index != currentIndex ? (index > currentIndex ? visiblePart : -visiblePart) : 0)
    }
    
    // Масштабирование активного квадрата
    func getScaleAmount() -> CGFloat {
        let max = screenWidth / 2
        let currentAmount = abs(offset.width)
        let percentage = currentAmount / max
        return 1.0 - min(percentage, 0.5) * 0.5
    }
    
    // Обработка окончания листания
    func handleDragEnd(value: DragGesture.Value) {
        let dragThreshold: CGFloat = 50
        
        if value.translation.width > dragThreshold && currentIndex > 0 {
            currentIndex -= 1
        } else if value.translation.width < -dragThreshold && currentIndex < squares.count - 1 {
            currentIndex += 1
        }
        // Вернуть offset в 0 после окончания анимации
        offset = .zero
        
    }
}
