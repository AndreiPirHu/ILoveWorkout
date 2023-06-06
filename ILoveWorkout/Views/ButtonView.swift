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


struct ButtonView: View {
    @ObservedObject var viewModel = ButtonViewModel()
    
    var body: some View {
        VStack{
            TextEditor(text: $viewModel.content)
                .background(.gray)
        }
        .navigationBarItems(trailing: Button("Save") {
            viewModel.saveExercise(workoutName: viewModel.content)
            viewModel.presentationMode.wrappedValue.dismiss()
        })
    }
    

    
        
    
}
