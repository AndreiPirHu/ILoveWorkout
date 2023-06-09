//
//  SignupViewModel.swift
//  ILoveWorkout
//
//  Created by Andrei Pirogov on 2023-06-06.
//


import Foundation
import SwiftUI
import FirebaseAuth

class SignupViewModel: ObservableObject {
    @AppStorage("uid") var userID: String = ""
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    func createUser() {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print(error)
                return
            }

            if let authResult = authResult {
                print(authResult.user.uid)
                self.userID = authResult.user.uid
            }
            
        }
    }
}
