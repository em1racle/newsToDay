//
//  SourceAndTitleNiewsView.swift
//  newsToDay
//
//  Created by Иван Семикин on 03/11/2024.
//

import SwiftUI

struct SourceAndTitleNewsView: View {
    @State var article: Article
    
    let category: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            Text(category)
                .foregroundStyle(.white)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(.purplePrimary)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            
            Text(article.title)
                .frame(width: 336, alignment: .leading)
                .font(.system(size: 26, weight: .bold))
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .padding(.top)
                .lineLimit(3)
                .minimumScaleFactor(0.5)
            
            Text(article.author ?? "")
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .padding(.top)
            
            Text("Author")
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundStyle(.gray)
                .padding(.bottom, 40)
        }
    }
}
