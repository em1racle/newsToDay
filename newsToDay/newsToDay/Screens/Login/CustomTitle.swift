//
//  TitleWithDescription.swift
//  newsToDay
//
//  Created by Emir Byashimov on 02.11.2024.
//

import SwiftUI

struct CustomTitle: View {
    // MARK: - Properties
    var title: LocalizedStringKey
    var description: LocalizedStringKey
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.system(size: 16))
                .fontWeight(.medium)
                .foregroundColor(.blackDark)
                .frame(width: 336, alignment: .topLeading)
            
            Text(description)
                .font(.system(size: 16))
                .fontWeight(.medium)
                .foregroundColor(.greyPrimary)
                .frame(width: 336, alignment: .topLeading)
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    CustomTitle(title: "Categories", description: "Thousands of articles in each category")
}
