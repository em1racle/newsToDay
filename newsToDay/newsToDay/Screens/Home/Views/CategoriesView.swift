//
//  CategoriesView.swift
//  newsToDay
//
//  Created by Иван Семикин on 21/10/2024.
//

import SwiftUI

struct CategoriesView: View {
    @Binding var selectedCategory: Category
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(Category.allCases, id: \.self) { category in
                    CategoryButton(
                        category: selectedCategory,
                        isSelected: selectedCategory == category) {
                            selectedCategory = category
                        }
                }
            }
            .padding()
        }
    }
}

// MARK: - CategoryButton
struct CategoryButton: View {
    let category: Category
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(category.rawValue)
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .foregroundColor(isSelected ? .white : .gray)
                .background(isSelected ? Color.blue : Color(.systemGray6))
                .cornerRadius(16)
        }
    }
}

#Preview {
    CategoriesView(selectedCategory: .constant(Category.sports))
}
