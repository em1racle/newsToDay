//
//  NewsDescriptionView.swift
//  newsToDay
//
//  Created by Sergey Zakurakin on 10/23/24.
//

import SwiftUI

struct NewsDescriptionView: View {
    var body: some View {
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
                    .fontWeight(.bold)
                
                Text("fdfsdfsdfsafsafasafasdfsafdsaffdfsdfsdfsafsafasafasdfsafdsaffdfsdfsdfsafsafasafasdfsafdsaffdfsdfsdfsafsafasafasdfsafdsaffdfsdfsdfsafsafasafasdfsafdsaffdfsdfsdfsafsafasafasdfsafdsaffdfsdfsdfsafsafasafasdfsafdsaffdfsdfsdfsafsafasafasdfsafdsaffdfsdfsdfsafsafasafasdfsafdsaffdfsdfsdfsafsafasafasdfsafdsaffdfsdfsdfsafsafasafasdfsafdsaffdfsdfsdfsafsafasafasdfsafdsaffdfsdfsdfsafsafasafasdfsafdsaffdfsdfsdfsafsafasafasdfsafdsaffdfsdfsdfsafsafasaf")
                    .font(.title) // redo
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    NewsDescriptionView()
}
