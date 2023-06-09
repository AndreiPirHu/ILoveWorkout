//
//  ContentView.swift
//  ILoveWorkout
//
//  Created by Jonas Backas on 2023-01-23.
//

import SwiftUI
import Firebase
import FirebaseAuth


struct WelcomeScreenView: View {
    @ObservedObject var viewModel = WelcomeScreenViewModel()
    
    var body: some View {
        NavigationView {
            GeometryReader { proxy in
                VStack {
                    Spacer().frame(height:
                                    proxy.size.height * 0.40)
                    Text("Workout Diary")
                        .font(.system(size: 59, weight: .medium))
                        .foregroundColor(.white)
                    Spacer()
                    NavigationLink (destination:
                                   HomeView(), isActive:
                                        $viewModel.isActive) {
                        Button(action: {
                            viewModel.continueButtonPressed()
                        }) {
                            HStack {
                                Image(systemName: "plus.circle")
                                    .font(.system(size: 24))
                                    .foregroundColor(.white)
                                Text("Continue")
                                    .font(.system(size: 24))
                                    .foregroundColor(.white)
                            }.padding()
                        }
                    }
                }.frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity
                )
                .background(
                    Image("LoveWorkout")
                        .resizable()
                        .aspectRatio(
                            contentMode: .fill
                        )
                        .edgesIgnoringSafeArea(.all)
                )
            }
        }
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreenView()
    }
}
