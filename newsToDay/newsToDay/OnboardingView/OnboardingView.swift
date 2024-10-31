//
//  OnboardingView.swift
//  newsToDay
//
//  Created by Sergey Zakurakin on 10/21/24.
//

import SwiftUI

struct OnboardingView: View {
    
    @ObservedObject var vm = OnboardingViewModel()
    @State private var isActive = false // состояние для перехода

    var body: some View {
        NavigationView {
            VStack {
                ImageView(
                    images: vm.images,
                    currentIndex: vm.currentIndex,
                    offset: vm.offset,
                    getOffsetForSquare: vm.getOffsetForSquare,
                    getScaleAmount: vm.getScaleAmount
                )
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            vm.offset = value.translation
                        }
                        .onEnded { value in
                            vm.handleDragEnd(value: value)
                        }
                )
                .padding(.top, 60)
                
                // Dots
                DotsView(total: vm.squares.count, currentIndex: vm.currentIndex)
                    .padding(.top, 40)
                
                // Text
                Text(vm.titles[vm.currentIndex])
                    .font(.system(size: 24))
                    .fontWeight(.semibold)
                    .padding(.top, 34)
                
                Text(vm.descriptionTitles[vm.currentIndex])
                    .font(.system(size: 16))
                    .multilineTextAlignment(.center)
                    .padding(.top, 10)
                    .padding(.horizontal, 80)
                
                Spacer()
                
                // Action Button
                NavigationLink(destination: HomeScreenView(), isActive: $isActive) {
                    BlueButtonView(buttonTitle: vm.isLastPage ? "Get Started" : "Next") {
                        if vm.isLastPage {
                            isActive = true
                        } else {
                            vm.goToNextPage()
                        }
                    }
                }
                .padding(.bottom, 50)
                .padding(.horizontal, 20)
            }
            .navigationBarHidden(true)
        }
    }
}
    #Preview {
        OnboardingView()
    }

