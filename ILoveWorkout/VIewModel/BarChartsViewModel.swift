//
//  BarChartsViewModel.swift
//  ILoveWorkout
//
//  Created by Andrei Pirogov on 2023-06-06.
//

import SwiftUI
import Charts
import Firebase
import FirebaseAuth
import Foundation

class BarChartsViewModel: ObservableObject {
    
    
    let db = Firestore.firestore()
    @Published var currentUser = Auth.auth().currentUser
    @Published var workoutCounter = [Exercise]()
    
    
    
    
    func listenToFirestore() {
        if let currentUser {
            db.collection("users").document(currentUser.uid).collection("exercises").addSnapshotListener { snapshot, err in
                guard let snapshot = snapshot else {return}
                
                if let err = err {
                    print("Error getting document \(err)")
                } else {
                    self.workoutCounter.removeAll()
                    for document in snapshot.documents {
                        
                        let result = Result {
                            try document.data(as: Exercise.self)
                        }
                        switch result  {
                        case .success(let workoutcount)  :
                            self.workoutCounter.append(workoutcount)
                        case .failure(let error) :
                            print("Error decoding workoutitem: \(error)")
                        }
                    }
                }
            }
        }
    }
    
}
