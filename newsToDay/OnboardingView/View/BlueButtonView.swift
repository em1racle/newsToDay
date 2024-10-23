//
//  BlueButtonView.swift
//  newsToDay
//
//  Created by Sergey Zakurakin on 10/22/24.
//

import SwiftUI

struct BlueButtonView: View {
    
    var buttonTitle: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(buttonTitle)
                .font(.system(size: 20, weight: .semibold))
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 10)
                .padding(.vertical, 24)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
}

#Preview {
    BlueButtonView(buttonTitle: "Next", action: {})
}

