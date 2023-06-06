//
//  AuthView.swift
//  ILoveWorkout
//
//  Created by Jonas Backas on 2023-02-15.
//

import SwiftUI
import FirebaseAuth

struct AuthView: View {
    @ObservedObject var viewModel = AuthViewModel()
    
    var body: some View {
        if(viewModel.currentViewShowing == "login") {
            LoginView(currentShowingView: $viewModel.currentViewShowing)
                .preferredColorScheme(.light)
        } else {
            SignupView(currentShowingView: $viewModel.currentViewShowing)
                .preferredColorScheme(.dark)
                .transition(.move(edge: .bottom))
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
