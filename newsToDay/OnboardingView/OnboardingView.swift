//
//  OnboardingView.swift
//  newsToDay
//
//  Created by Sergey Zakurakin on 10/21/24.
//

import SwiftUI

struct OnboardingView: View {
    
    @Environment(AppRouter.self) private var appRouter
    @ObservedObject var vm = OnboardingViewModel()
    
    var body: some View {
        
        @Bindable var appRouter = appRouter
        
        NavigationStack(path: $appRouter.appRoute) {
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
                //ActionButton
                BlueButtonView(buttonTitle: vm.isLastPage ? "Get Started" : "Next") {
                    if vm.isLastPage {
                        // transition action
                        appRouter.appRoute.append(.home)
                    } else {
                        vm.goToNextPage()
                    }
                }
                .padding(.bottom, 50)
                .padding(.horizontal, 20)
                .navigationDestination(for: MainViewPath.self) { place in
                    switch place {
                    case .home:
                        HomeScreenView()
                    case .onboarding:
                        OnboardingView()
                    case .bookmark:
                        BookmarksView()
                    case .profile:
                        ProfileView()
                    case .language:
                        LanguageView()
                    case .terms:
                        TermsView()
                    }
                }
            }
        }
    }
}

#Preview {
    OnboardingView()
        .environment(AppRouter())
}
