//
//  ProfileViewModel.swift
//  ILoveWorkout
//
//  Created by Andrei Pirogov on 2023-06-06.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseAuth

class ProfileViewModel: ObservableObject {
    @AppStorage("uid") var userID: String = ""
    @Published var logoutOptions = false
    @Published var userIsLoggedIn = false
    @Published var currentIndex = 0
    @Published var numberOfImages = 6
    
    let timer = Timer.publish(every: 2, on: .main, in: .common
    ).autoconnect()
    
    
    func previous() {
        withAnimation {
            currentIndex = currentIndex > 0 ? currentIndex
            - 1 : numberOfImages  - 1
        }
    }

    func next() {
        withAnimation {
            currentIndex = currentIndex <
                numberOfImages ? currentIndex + 1 : 0
            }
        }
    
    func signOut() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            withAnimation {
                userID = ""
            }
            print("Succes! You signed out")
        } catch let signOutError as NSError {
            print("Error signing out: #€", signOutError)
        }
        
    }
    
}
