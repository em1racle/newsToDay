//
//  StartScreenView.swift
//  newsToDay
//
//  Created by Sergey Zakurakin on 10/23/24.
//

import SwiftUI

struct StartScreenView: View {
    
    @State var showOnboarding = false
    
    var body: some View {
        if showOnboarding {
            OnboardingView()
        } else {
            ZStack {
                Color.purpleDarker
                    .ignoresSafeArea()
                VStack {
                    Text("News")
                    Text("ToDay")
                }
                .foregroundStyle(.white)
                .font(.system(size: 68))
                
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation(.easeInOut) {
                        showOnboarding = true
                    }
                }
            }
        }
    }
}


#Preview {
    StartScreenView()
}
