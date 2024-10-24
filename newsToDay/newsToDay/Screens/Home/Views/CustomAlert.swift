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
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)

                VStack(spacing: 20) {
                    Text(message)
                        .font(.headline)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(radius: 20)

                    Button("OK") {
                        isPresented = false
                    }
                    .padding()
                }
                .padding()
            }
        }
    }
}

extension View {
    func customAlert(isPresented: Binding<Bool>, message: String) -> some View {
        self.modifier(CustomAlert(isPresented: isPresented, message: message))
    }
}
