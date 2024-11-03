//
//  DescriptionNewsView.swift
//  newsToDay
//
//  Created by Иван Семикин on 03/11/2024.
//

import SwiftUI

struct DescriptionNewsView: View {
    var article: Article
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Result")
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.top)
                .frame(width: 336, alignment: .leading)
            
            Text(article.description ?? "No description available.")
                .font(.body)
                .frame(width: 336, alignment: .leading)
                .multilineTextAlignment(.leading)
                .padding(.top)
        }
        .padding(.horizontal)
    }
}
