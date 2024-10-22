//
//  MainButton.swift
//  newsToDay
//
//  Created by Emir Byashimov on 22.10.2024.
//

import SwiftUI

struct MainButton: View {
    
    var buttonText: LocalizedStringKey = LocalizedStringKey("Button")
    var buttonFontSize: CGFloat = 18
    var buttonFontWeight: Font.Weight = .medium
    var buttonColor: Color = .greyLighter
    var buttonCornerRadius: CGFloat = 12
    var showIconImage: Bool = false
    var iconImageName: String = "chevron.right"
    var buttonHeight: CGFloat = 70
    
    var action: (() -> Void)?
    
    var body: some View {
        Button {
            action?()
        } label: {
            HStack(alignment: .center, spacing: 10) {
                Text(buttonText)
                    .font(.system(size: buttonFontSize, weight: buttonFontWeight, design: .default))
                    .foregroundStyle(.greyDark)
                    .lineLimit(1)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                if showIconImage {
                    Image(systemName: iconImageName)
                        .foregroundColor(.greyDark)
                        .frame(width: 24)
                        .imageScale(.large)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background {
                    RoundedRectangle(cornerRadius: buttonCornerRadius, style: .continuous)
                        .fill(buttonColor)
                        .frame(height: buttonHeight)
                }
            }
        }
}

#Preview("LightEN") {
    VStack(spacing: 0) {
        MainButton()
            .padding()
            .environment(\.locale, .init(identifier: "EN"))
            .preferredColorScheme(.light)
        
        MainButton(buttonText: "Button", buttonColor: .greyLighter, showIconImage: true)
            .padding()
            .environment(\.locale, .init(identifier: "EN"))
            .preferredColorScheme(.light)
    }
}

