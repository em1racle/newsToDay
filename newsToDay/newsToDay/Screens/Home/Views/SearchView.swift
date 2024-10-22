//
//  SearchView.swift
//  newsToDay
//
//  Created by Иван Семикин on 21/10/2024.
//

import SwiftUI

struct SearchView: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.gray)
            
            TextField("Search", text: $searchText)
                .foregroundStyle(.primary)
                .padding(8)
        }
        .padding()
        .background(Color(.systemGray6))
        .clipShape(.rect(cornerRadius: 10))
        .frame(height: 56)
    }
}

#Preview {
    SearchView(searchText: .constant("Hello"))
}
