//
//  CustomTextField.swift
//  newsToDay
//
//  Created by Emir Byashimov on 02.11.2024.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    @State private var isPasswordVisible: Bool = false
    @FocusState private var isFocused: Bool
    
    var icon: Image
    var placeholder: LocalizedStringKey
    var isSecure: Bool = false
    var promptEmail: LocalizedStringKey =  "Email Address"
    
    var body: some View {
        HStack {
            icon
                .resizable()
                .frame(width: 24)
                .foregroundColor(isFocused ? .purplePrimary : .greyPrimary)
                .padding(.trailing, 24)
            
            if isSecure {
                Group {
                    if isPasswordVisible {
                        TextField(placeholder, text: $text)
                    } else {
                        SecureField(placeholder, text: $text)
                    }
                }
                .autocapitalization(.none)
                .foregroundColor(.greyPrimary)
                .font(.system(size: 16))
                .focused($isFocused)
                
                Button {
                    isPasswordVisible.toggle()
                } label: {
                    Image(systemName: isPasswordVisible ? "eye" : "eye.slash")
                        .renderingMode(.template)
                        .frame(width: 24, height: 24)
                        .foregroundColor(isPasswordVisible ? .purplePrimary : .greyPrimary)
                }
            } else {
                TextField(placeholder, text: $text)
                    .autocapitalization(.none)
                    .foregroundColor(.greyPrimary)
                    .font(.system(size: 16))
                    .focused($isFocused)
            }
        }
        .padding(.horizontal, 16)
        .frame(width: 336, height: 56)
        .background(Color.greyLighter)
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(isFocused ? .purplePrimary : Color.clear, lineWidth: 1)
        )
        .animation(.easeInOut, value: isFocused)
    }
}
