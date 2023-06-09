//
//  WorkoutViewModel.swift
//  ILoveWorkout
//
//  Created by Andrei Pirogov on 2023-06-06.
//

import Foundation
import Firebase
import FirebaseAuth

class WorkoutViewModel: ObservableObject {
    @Published var workoutItems = [Exercise]()
    @Published var logoutOptions = false
    
    let db = Firestore.firestore()
    let currentUser = Auth.auth().currentUser
    
    
    func workoutDone(workoutItems: Exercise) {
        
        if let user = self.currentUser {
            if let documentid = workoutItems.id {
                db.collection("users").document(user.uid).collection("exercises").document(documentid).updateData(["done": !workoutItems.done])
                
            }
        }
    }
    
    
    
    func deleteWorkout(index: Int) {
        let workoutitem = workoutItems[index]
        if let id = workoutitem.id,
           let user = Auth.auth().currentUser
        {
            db.collection("users").document(user.uid).collection("exercises").document(id).delete()
        }
    }
    
    
    
    //Läser ner firebase övningar, hämtar data från firebase.
    func listenToFirestore() {
        if let currentUser {
            db.collection("users").document(currentUser.uid).collection("exercises").addSnapshotListener { snapshot, err in
                guard let snapshot = snapshot else {return}
                
                if let err = err {
                    print("Error getting document \(err)")
                } else {
                    self.workoutItems.removeAll()
                    for document in snapshot.documents {

                        let result = Result {
                            try document.data(as: Exercise.self)
                        }
                        switch result  {
                        case .success(let workoutitem)  :
                            self.workoutItems.append(workoutitem)
                        case .failure(let error) :
                            print("Error decoding workoutitem: \(error)")
                           }
                        }
                    }
                }
            }
        }
    
    }
    
    

