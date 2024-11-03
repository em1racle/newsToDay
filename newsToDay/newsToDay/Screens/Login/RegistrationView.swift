//
//  RegistrationView.swift
//  newsToDay
//
//  Created by Emir Byashimov on 02.11.2024.
//

import SwiftUI
import FirebaseAuth

struct RegistrationView: View {
    // MARK: - Properties
    @ObservedObject var viewModel: RegisterViewModel
    
    var usernameText: LocalizedStringKey = "Username"
    var promptEmail: LocalizedStringKey = "Email Address"
    var promptPassword: LocalizedStringKey = "Password"
    var promptConfirm: LocalizedStringKey = "Repeat Password"
    var buttonText: LocalizedStringKey = "Sign Up"
    var haveAccount: LocalizedStringKey = "Already have an account?"
    var signIn: LocalizedStringKey = "Sign In"
    
    var title: LocalizedStringKey = "Welcome to NewsToDay"
    var subtitle: LocalizedStringKey = "Hello, I guess you are new around here. You can start using the application after sign up."
    var error: String = "Error"
    var ok: String = "OK"
   

    var body: some View {
       
        NavigationStack {
            VStack {
                CustomTitle(title: title, description: subtitle)
                    .padding(.top, 28)
                
                VStack(spacing: 16) {
                    CustomTextField(text: $viewModel.username, icon: Image(""), placeholder: usernameText)
                        .autocapitalization(.none)
                    CustomTextField(text: $viewModel.email, icon: Image(""), placeholder: promptEmail)
                        .autocapitalization(.none)
                    CustomTextField(text: $viewModel.password, icon: Image(""), placeholder: promptPassword, isSecure: true)
                        .autocapitalization(.none)
                    CustomTextField(text: $viewModel.confirmPassword, icon: Image(""), placeholder: promptConfirm, isSecure: true)
                        .autocapitalization(.none)
                    
                    if let error = viewModel.passwordMatchError {
                        Text(error)
                            .foregroundColor(.red)
                            .font(.system(size:16))
                            .fontWeight(.medium)
                            .padding(.leading, 20)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 32)
                
                ActionButtonView(buttonText: buttonText, action: viewModel.register)
                    .padding(.top, 16)
                
                Spacer()
                
                HStack {
                    Text(haveAccount)
                        .foregroundColor(.blackLighter)
                        .font(.system(size:16))
                        .fontWeight(.medium)
                    Button(action: { viewModel.navigateToLogin = true }) {
                        Text(signIn)
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
            .navigationDestination(isPresented: $viewModel.navigateToMainTab) {
                ContentView()
            }
            .navigationDestination(isPresented: $viewModel.navigateToLogin) {
                LoginPageView(viewModel: RegisterViewModel())
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
}

#Preview {
    RegistrationView(viewModel: RegisterViewModel())
}
