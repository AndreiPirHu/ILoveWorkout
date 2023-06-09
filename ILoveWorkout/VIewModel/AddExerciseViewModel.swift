//
//  ButtonViewModel.swift
//  ILoveWorkout
//
//  Created by Andrei Pirogov on 2023-06-06.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseAuth


class AddExerciseViewModel: ObservableObject {
    @Published var content : String = ""
    
    let db = Firestore.firestore()
    let currentUser = Auth.auth().currentUser
    
    
    func saveExercise(exerciseName: String) {
        if let currentUser {
        db.collection("users").document(currentUser.uid).collection("exercises").addDocument(data:
            ["name" : exerciseName,
             "exercise" : "",
             "done": false,
             "date": Date(),
             "workoutCount": 1])
            }
        }
        
    
}
    
    
