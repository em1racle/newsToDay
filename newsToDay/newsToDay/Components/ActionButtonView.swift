//
//  ActionButtonView.swift
//  newsToDay
//
//  Created by Emir Byashimov on 02.11.2024.
//

import SwiftUI

// MARK: - ActionButtonView
struct ActionButtonView: View {
    // MARK: - Properties
    var buttonText: LocalizedStringKey
    var action: () -> Void
   
    // MARK: - Body
    var body: some View {
        Button(action: {
            action()
        }) {
            Text(buttonText)
                .font(.system(size: 16))
                .frame(width: 336, height: 56)
                .background(.purplePrimary)
                .cornerRadius(12)
                .padding(.horizontal, 20)
                .foregroundColor(.white)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    ActionButtonView(buttonText: "Next", action: {})
}
