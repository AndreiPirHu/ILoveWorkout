//
//  WelcomeScreenVIewModel.swift
//  ILoveWorkout
//
//  Created by Andrei Pirogov on 2023-06-06.
//

import Foundation

class WelcomeScreenViewModel: ObservableObject {
    
    @Published var isActive = false
    
    
    func continueButtonPressed() {
        isActive = true
    }
    
}
