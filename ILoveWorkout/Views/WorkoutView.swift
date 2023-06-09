//
//  WorkoutView.swift
//  ILoveWorkout
//
//  Created by Jonas Backas on 2023-02-06.
//

import SwiftUI
import Firebase
import FirebaseAuth


struct WorkoutView: View {
    
    @ObservedObject var viewModel = WorkoutViewModel()
    
    var body: some View {
        NavigationView {
            VStack() {
                List {
                    ForEach(viewModel.workoutItems) {workoutItems in
                        HStack {
                            Text(workoutItems.name)
                            Spacer()
                            Button(action: {
                                viewModel.workoutDone(workoutItems: workoutItems)
                            }) {
                                Image(systemName: workoutItems.done ? "checkmark.square" : "square")
                            }
                        }
                    }.onDelete() { indexSet in
                        for index in indexSet {
                            viewModel.deleteWorkout(index: index)
                        }
                    }
                }
            }.navigationBarTitle("Exercise List")
                .navigationBarItems(trailing: NavigationLink(destination: AddExerciseView())
                                    {
                    Image(systemName: "plus.circle")
                        .transition(.move(edge: .bottom
                                         ))
                })
            
                .onAppear() {
                    viewModel.listenToFirestore()
                }
                .padding()
        }
    }
    
    
}
        

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView()
    }
}
