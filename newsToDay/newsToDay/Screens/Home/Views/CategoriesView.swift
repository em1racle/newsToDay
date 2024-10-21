//
//  CategoriesView.swift
//  newsToDay
//
//  Created by Иван Семикин on 21/10/2024.
//

import SwiftUI

struct CategoriesView: View {
    @Binding var selectedCategory: Categories
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(Categories.allCases, id: \.self) { category in
                    Button {
                        selectedCategory = category
                    } label: {
                        let isSelected = selectedCategory == category
                        
                        Text(category.rawValue)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                            .foregroundStyle(isSelected ? .white : .gray)
                            .background(isSelected ? .blue : Color(.systemGray6))
                            .clipShape(.rect(cornerRadius: 16))
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    CategoriesView(selectedCategory: .constant(Categories.sports))
}
