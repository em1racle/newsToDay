//
//  HomeScreenView.swift
//  newsToDay
//
//  Created by Иван Семикин on 21/10/2024.
//

import SwiftUI

enum Category: String, CaseIterable {
    case sports = "Sports"
    case politics = "Politics"
    case life = "Life"
    case gaming = "Gaming"
    case animals = "Animals"
    case nature = "Nature"
    case food = "Food"
    case art = "Art"
    case history = "History"
    case fashion = "Fashion"
    case covid19 = "Covid-19"
    case middleEast = "Middle East"
}

struct HomeScreenView: View {
    @State private var searchText = ""
    @State private var selectedCategory: Category = .sports
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    Text("Discover things of this world")
                        .foregroundStyle(.secondary)
                        .padding(.bottom, 32)
                    
                    SearchView(searchText: $searchText)
                    
                    CategoriesView(selectedCategory: $selectedCategory)
                }
                .navigationTitle("Browse")
                .padding([.horizontal, .bottom])
            }
        }
    }
}

#Preview {
    HomeScreenView()
}
