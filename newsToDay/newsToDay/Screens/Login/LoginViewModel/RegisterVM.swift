//
//  RegisterViewModel.swift
//  newsToDay
//
//  Created by Emir Byashimov on 11/2/24.
//


import Foundation
import SwiftUI
import FirebaseAuth
import FirebaseCore
import FirebaseStorage
import FirebaseFirestore
import FirebaseFirestoreCombineSwift

class RegisterViewModel: ObservableObject {
    @Published var userSession: User?
    @Published var didAuthenticateUser = false
    @Published var navigateToLogin = false
    @Published var navigateToMainTab = false
    @Published var navigateToSignUp = false
    @Published var showAlert = false
    @Published var email: String = ""
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var alertMessage = ""
    @Published var confirmPassword: String = ""
    @Published var passwordMatchError: String? = nil
    @Published var emailAlert: String = "Please enter your email and password."
    @Published var matchError: String = "Passwords do not match."
      private var tempUserSession: User?
    init() {
           self.userSession = Auth.auth().currentUser
           fetchEmail()
           fetchUsername()
       }
       
       // MARK: - Registration
       func register() {
           guard passwordMatchError == nil else { return }
           
            if password == confirmPassword {
                passwordMatchError = nil
            } else {
                passwordMatchError = matchError
            }
           
           
           if StorageManager.shared.isUsernameTaken(username) {
               alertMessage = "This username is already used. Please choose another username."
               showAlert = true
               return
           }
           
           Auth.auth().createUser(withEmail: email, password: password) { result, error in
               if let error = error {
                   self.alertMessage = error.localizedDescription
                   self.showAlert = true
               } else if let result = result {
                   self.userSession = result.user
                   self.email = result.user.email ?? ""
                   
                 
                   StorageManager.shared.saveUsername(self.username)
                   
                   self.navigateToMainTab = true
               }
           }
           
           
       }
       
       // MARK: - Login
       func LogIn() {
           if email.isEmpty || password.isEmpty {
               alertMessage = emailAlert
               showAlert = true
               return
           }

           Auth.auth().signIn(withEmail: email, password: password) { result, error in
               if let error = error {
                   self.alertMessage = error.localizedDescription
                   self.showAlert = true
               } else if let result = result {
                   self.userSession = result.user
                   self.email = result.user.email ?? ""
                
                   self.fetchUsername()
                   
                   self.navigateToMainTab = true
               }
           }
       }
       
       // MARK: - Sign Out
    func signOut() {
        do {
            try Auth.auth().signOut()
            userSession = nil
            didAuthenticateUser = false
            email = ""
            username = ""
        } catch {
            print("DEBUG: Sign out failed with error: \(error.localizedDescription)")
            alertMessage = "Sign out failed. Please try again."
            showAlert = true
        }
    }
       
       // MARK: - Fetch Email for Current Session
       private func fetchEmail() {
           if let user = Auth.auth().currentUser {
               self.email = user.email ?? ""
           }
       }
       
       // MARK: - Fetch Username from Storage
       private func fetchUsername() {
           if let savedUsername = StorageManager.shared.getUsername() {
               self.username = savedUsername
           }
       }
       
       // MARK: - Check Password Match
       func checkPasswordMatch() {
           passwordMatchError = password == confirmPassword ? nil : "Passwords do not match."
       }
   }

