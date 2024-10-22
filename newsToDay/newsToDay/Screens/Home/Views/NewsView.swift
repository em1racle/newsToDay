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
                    NavigationLink {
                        Text("Detail of news")
                    } label: {
                        ZStack {
                            new.image
                                .resizable()
                                .aspectRatio(1.0, contentMode: .fit)
                                .clipShape(.rect(cornerRadius: 12))
                            
                            Color.black.opacity(0.3)
                                .clipShape(.rect(cornerRadius: 12))
                            
                            VStack(alignment: .leading, spacing: 8) {
                                HStack {
                                    Spacer()
                                    
                                    Image(systemName: "bookmark")
                                        .font(.system(size: 24))
                                        .bold()
                                        .foregroundStyle(.white)
                                }
                                
                                Spacer()
                                
                                Text(new.category.rawValue.uppercased())
                                    .font(.system(size: 12))
                                    .foregroundStyle(.white)
                                    .multilineTextAlignment(.leading)
                                
                                Text(new.title)
                                    .font(.system(size: 16))
                                    .foregroundStyle(.white)
                                    .bold()
                                    .multilineTextAlignment(.leading)
                            }
                            .padding(24)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.75, height: UIScreen.main.bounds.width * 0.75)
                    }
                }
            }
        }
        .frame(height: UIScreen.main.bounds.width * 0.75)
    }
}

#Preview {
    NewsView(news: [
            NewsMock(imageName: "TestImageOfNews", title: "A jittery Harris campaign makes big plans to clinch a narrow win", category: .sports),
            NewsMock(imageName: "TestImageOfNews", title: "Title 2", category: .politics),
            NewsMock(imageName: "TestImageOfNews", title: "Title 3", category: .art)
        ])
}
