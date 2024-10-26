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
        Text(buttonTitle)
            .font(.system(size: 16, weight: .semibold))
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 10)
            .padding(.vertical, 24)
            .background(.purplePrimary)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .onTapGesture {
                action()
            }
    }
}

#Preview {
    BlueButtonView(buttonTitle: "Next", action: {})
}

