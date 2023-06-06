//
//  ButtonView.swift
//  ILoveWorkout
//
//  Created by Jonas Backas on 2023-02-09.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseAuth


struct AddExerciseView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel = AddExerciseViewModel()
    
    var body: some View {
        VStack{
            TextEditor(text: $viewModel.content)
                .background(.gray)
        }
        .navigationBarItems(trailing: Button("Save") {
            viewModel.saveExercise(exerciseName: viewModel.content)
            presentationMode.wrappedValue.dismiss()
        })
    }
    

    
        
    
}
