//
//  CustomAlert.swift
//  newsToDay
//
//  Created by Иван Семикин on 24/10/2024.
//

import SwiftUI

struct CustomAlert: ViewModifier {
    @Binding var isPresented : Bool
    var message: String
    
    func body(content: Content) -> some View {
        ZStack {
            content
            if isPresented {
                VStack(spacing: 20) {
                    Image(.error)
                        .resizable()
                        .scaledToFit()
                    
                    Text(message)
                        .font(.title2)
                        .bold()
                        .padding()

                    Button("OK") {
                        isPresented = false
                    }
                    .padding()
                }
                .padding()
                .background(.white)
                .clipShape(.rect(cornerRadius: 20))
                .shadow(color: .black.opacity(0.4), radius: 10)
                .frame(width: UIScreen.main.bounds.width * 0.9)
            }
        }
    }
}

extension View {
    func customAlert(isPresented: Binding<Bool>, message: String) -> some View {
        self.modifier(CustomAlert(isPresented: isPresented, message: message))
    }
}
