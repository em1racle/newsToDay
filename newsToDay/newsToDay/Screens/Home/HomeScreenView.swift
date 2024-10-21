//
//  HomeScreenView.swift
//  newsToDay
//
//  Created by Иван Семикин on 21/10/2024.
//

import SwiftUI

struct HomeScreenView: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            ScrollView() {
                VStack(alignment: .leading) {
                    Text("Discover things of this world")
                        .foregroundStyle(.secondary)
                        .padding(.bottom, 32)
                    
                    SearchView(searchText: $searchText)
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
