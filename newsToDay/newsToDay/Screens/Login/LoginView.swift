//
//  LoginView.swift
//  newsToDay
//
//  Created by Emir Byashimov on 01.11.2024.
//

import SwiftUI
import FirebaseAuth

struct LoginPageView: View {
    // MARK: - Properties
    @ObservedObject var viewModel: RegisterViewModel
    @State private var path = NavigationPath()
    
    var title: LocalizedStringKey = "Welcome Back"
    var subtitle: LocalizedStringKey = "I am happy to see you again. You can continue where you left off by logging in"
    var promptEmail: LocalizedStringKey = "Email Address"
    var promptPassword: LocalizedStringKey = "Password"
    var buttonText: LocalizedStringKey = "Sign In"
    var noAccount: LocalizedStringKey = "Don’t have an account?"
    var registerText: LocalizedStringKey = "Sign Up"
    var error: String = "Error"
    var ok: String = "OK"
   
    // MARK: - Body
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                CustomTitle(title: title, description: subtitle)
                    .padding(.top, 28)
                
                VStack(spacing: 16) {
                    CustomTextField(
                        text: $viewModel.email, icon: Image("envelope"),
                        placeholder: promptEmail
                    )
                    
                    CustomTextField(
                        text: $viewModel.password, icon: Image("padlock"),
                        placeholder: promptPassword,
                        isSecure: true
                    )
                }
                .padding(.horizontal, 20)
                .padding(.top, 32)
                
                ActionButtonView(buttonText: buttonText, action: {viewModel.LogIn()
                    if viewModel.navigateToMainTab {
                        path.append("MainTab")
                    }})
                .padding(.top, 64)
                
                Spacer()
                
                HStack {
                    Text(noAccount)
                        .foregroundColor(.blackLighter)
                        .font(.system(size:16))
                        .fontWeight(.medium)
                    Button(action: {
                        viewModel.navigateToSignUp = true
                        if viewModel.navigateToSignUp {
                            path.append("Registration")
                        }
                    }) {
                        Text(registerText)
                            .foregroundColor(.blackPrimary)
                            .font(.system(size:16))
                            .fontWeight(.medium)
                    }
                }
                .padding(.bottom, 8)
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text(error), message: Text(viewModel.alertMessage), dismissButton: .default(Text(ok)))
            }
            .navigationDestination(for: String.self) { destination in
                if destination == "MainTab" {
                    ContentView()
                } else if destination == "Registration" {
                    RegistrationView(viewModel: RegisterViewModel())
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    LoginPageView(viewModel: RegisterViewModel())
}

