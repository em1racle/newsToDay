//
//  NewsDescriptionView.swift
//  newsToDay
//
//  Created by Sergey Zakurakin on 10/23/24.
//

import SwiftUI

struct NewsDescriptionView: View {
    var body: some View {
        NavigationStack{
        ScrollView {
            VStack {
                ZStack {
                        Image(.testImageOfNews)
                            .resizable()
                            .frame(height: 384)
                            .frame(maxWidth: .infinity)
                        
                        Text("fdsfsd")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                    }
                    Text("Result")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("fdfsdfsdfsafsafasafasdfsafdsaffdfsdfsdfsafsafasafasdfsafdsaffdfsdfsdfsafsafasafasdfsafdsaffdfsdfsdfsafsafasafasdfsafdsaffdfsdfsdfsafsafasafasdfsafdsaffdfsdfsdfsafsafasafasdfsafdsaffdfsdfsdfsafsafasafasdfsafdsaffdfsdfsdfsafsafasafasdfsafdsaffdfsdfsdfsafsafasafasdfsafdsaffdfsdfsdfsafsafasafasdfsafdsaffdfsdfsdfsafsafasafasdfsafdsaffdfsdfsdfsafsafasafasdfsafdsaffdfsdfsdfsafsafasafasdfsafdsaffdfsdfsdfsafsafasafasdfsafdsaffdfsdfsdfsafsafasaf")
                        .font(.title) // redo
                }
            .toolbar() {
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink(destination: OnboardingView()) {
                        Image("user1")
                            .foregroundStyle(.white)
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: OnboardingView()) {
                        Image("user1")
                            .foregroundStyle(.white)
                    }
                }
                
                
            }
            }
            .ignoresSafeArea()
  
        }
    }
}
#Preview {
    NewsDescriptionView()
}
