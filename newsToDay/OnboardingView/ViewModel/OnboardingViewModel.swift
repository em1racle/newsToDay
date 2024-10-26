//
//  OnboardingViewModel.swift
//  newsToDay
//
//  Created by Sergey Zakurakin on 10/22/24.
//

import SwiftUI

final class OnboardingViewModel: ObservableObject {
    
//    @Published var showStartScreen = true
    @Published var currentIndex: Int = 0
    @Published var offset: CGSize = .zero
    
    let images: [String] = ["TestImageOfNews", "TestImageOfNews", "TestImageOfNews"]
    let screenWidth = UIScreen.main.bounds.width
    let squares: [Color] = [.red, .green, .blue]
    let titles: [LocalizedStringKey] = [LocalizedStringKey("First to Know"), LocalizedStringKey("Breaking News"), LocalizedStringKey("Be the First to Discover")]
    let descriptionTitles: [LocalizedStringKey] = [
        "All news in one place, be the first to know last news",
        "Stay Informed: Be the First to Catch the Latest News",
        "Get All the Updates and stay Ahead with Breaking News"
    ]
    
//    init() {
//        hideStartScreen()
//    }
    
    
    // delay start screen
//    func hideStartScreen() {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
//                withAnimation {
//                    self.showStartScreen = false
//                }
//            }
//        }
  
    // Checking for last
    var isLastPage: Bool {
        currentIndex == squares.count - 1
    }
    
    
    
    // transition func for next screen
    func goToNextPage() {
        if currentIndex < squares.count - 1 {
            currentIndex += 1
        }
    }
    
    // counting offset for screens
    func getOffsetForSquare(at index: Int) -> CGFloat {
        let visiblePart: CGFloat = 40 // Offset for other squares
        let baseOffset = CGFloat(index - currentIndex) * screenWidth * 0.8 // Offset for central squares
        return baseOffset + (index != currentIndex ? (index > currentIndex ? visiblePart : -visiblePart) : 0)
    }
    
    // Scaling the active square
    func getScaleAmount() -> CGFloat {
        let max = screenWidth / 2
        let currentAmount = abs(offset.width)
        let percentage = currentAmount / max
        return 1.0 - min(percentage, 0.5) * 0.5
    }
    
    // Handling the end of swiping
    func handleDragEnd(value: DragGesture.Value) {
        let dragThreshold: CGFloat = 50
        
        if value.translation.width > dragThreshold && currentIndex > 0 {
            currentIndex -= 1
        } else if value.translation.width < -dragThreshold && currentIndex < squares.count - 1 {
            currentIndex += 1
        }
        // return offset 0 after finishing animation
        offset = .zero
        
    }
}
