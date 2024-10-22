//
//  OnboardingView.swift
//  newsToDay
//
//  Created by Sergey Zakurakin on 10/21/24.
//

import SwiftUI

struct OnboardingView: View {
    
    @ObservedObject var vm = OnboardingViewModel()
    
    var body: some View {
        VStack {
            ZStack {
                ForEach(0..<vm.squares.count, id: \.self) { index in
                    RoundedRectangle(cornerRadius: 20)
                        .fill(vm.squares[index])
                        .frame(width: 288, height: 336)
                        .offset(x: vm.getOffsetForSquare(at: index) + vm.offset.width, y: 0)
                        .scaleEffect(index == vm.currentIndex ? vm.getScaleAmount() : 0.8)
                        .opacity(index == vm.currentIndex ? 1.0 : 0.7)
                        .animation(.spring(), value: vm.currentIndex)
                }
            }
        } .gesture(
            DragGesture()
                .onChanged { value in
                    vm.offset = value.translation
                }
                .onEnded { value in
                    vm.handleDragEnd(value: value)
                }
        )
        
    }
}

#Preview {
    OnboardingView()
}
