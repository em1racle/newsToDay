//
//  NewsView.swift
//  newsToDay
//
//  Created by Иван Семикин on 22/10/2024.
//

import SwiftUI

struct NewsMock: Hashable {
    let imageName: String
    let title: String
    let category: Category
    
    var image: Image {
        Image(imageName)
    }
}

struct NewsView: View {
    let news: [NewsMock]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 16) {
                ForEach(news, id: \.self) { new in
                    new.image
                        .resizable()
                        .aspectRatio(1.0, contentMode: .fill)
                }
            }
            .padding()
        }
        .frame(height: UIScreen.main.bounds.width * 0.75)
    }
}

#Preview {
    NewsView(news: [
            NewsMock(imageName: "TestImageOfNews", title: "Title 1", category: .sports),
            NewsMock(imageName: "TestImageOfNews", title: "Title 2", category: .politics),
            NewsMock(imageName: "TestImageOfNews", title: "Title 3", category: .art)
        ])
}
