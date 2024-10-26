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
    var buttonHeight: CGFloat = 64
    var isSelected: Bool = false
    
    var action: (() -> Void)?
    
    var body: some View {
        Button {
            action?()
        } label: {
            HStack(alignment: .center, spacing: 10) {
                Text(buttonText)
                    .font(.system(size: buttonFontSize, weight: buttonFontWeight, design: .default))
                    .foregroundColor(isSelected ? .white : .greyDark)
                    .lineLimit(1)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                if showIconImage {
                    Image(systemName: iconImageName)
                        .foregroundColor(isSelected ? .white : .greyDark)
                        .frame(width: 24)
                        .imageScale(.large)
                }
                
                if isSelected {
                    Image(systemName: "checkmark")
                        .foregroundColor(.white)
                        .font(.title3.weight(.medium))
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background {
                RoundedRectangle(cornerRadius: buttonCornerRadius, style: .continuous)
                    .fill(isSelected ? Color.purplePrimary : buttonColor)
                    .frame(height: buttonHeight)
            }
        }
    }
}

#Preview("LightEN") {
    VStack(spacing: 0) {
        MainButton(isSelected: true)
            .padding()
            .environment(\.locale, .init(identifier: "EN"))
            .preferredColorScheme(.light)
        
        MainButton(buttonText: "Button", buttonColor: .greyLighter, showIconImage: true, isSelected: false)
            .padding()
            .environment(\.locale, .init(identifier: "EN"))
            .preferredColorScheme(.light)
    }
}
