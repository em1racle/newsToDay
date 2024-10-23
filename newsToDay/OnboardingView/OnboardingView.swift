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
            ImageView(
                        images: vm.images,
                        currentIndex: vm.currentIndex,
                        offset: vm.offset,
                        getOffsetForSquare: vm.getOffsetForSquare,
                        getScaleAmount: vm.getScaleAmount
                    )
        } .gesture(
            DragGesture()
                .onChanged { value in
                    vm.offset = value.translation
                }
                .onEnded { value in
                    vm.handleDragEnd(value: value)
                }
        )
        // Dots
        DotsView(total: vm.squares.count, currentIndex: vm.currentIndex)
        .padding(.top, 20)
        
        // Text
        Text(vm.titles[vm.currentIndex])
            .font(.title)
            .animation(.spring(), value: vm.currentIndex)
            .padding(.top, 40)
        
        Text(vm.descriptionTitles[vm.currentIndex])
            .animation(.spring(), value: vm.currentIndex)
            .padding(35)
        
        //ActionButton
        BlueButtonView(buttonTitle: vm.isLastPage ? "Get Started" : "Next") {
                    if vm.isLastPage {
                        // transition action
                    } else {
                        vm.goToNextPage()
                    }
                }
                .padding(.horizontal, 40)
    }
}

#Preview {
    OnboardingView()
}
