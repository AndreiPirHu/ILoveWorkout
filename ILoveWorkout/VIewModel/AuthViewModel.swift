//
//  AuthViewModel.swift
//  ILoveWorkout
//
//  Created by Andrei Pirogov on 2023-06-06.
//

import Foundation

class AuthViewModel: ObservableObject {
    @Published var currentViewShowing: String = "login" //login or signup
}
