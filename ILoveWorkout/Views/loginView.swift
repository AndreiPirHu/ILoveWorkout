//
//  loginView.swift
//  ILoveWorkout
//
//  Created by Jonas Backas on 2023-02-15.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    
    @Binding var currentShowingView: String
    
    @ObservedObject var viewModel = LoginViewModel()
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Text("Hello, & Welcome")
                        .font(.largeTitle)
                        .bold()
                    
                    Spacer()
                }
                .padding()
                .padding(.top)
                
                Spacer()
                
                HStack {
                    Image(systemName: "mail")
                    TextField("Email", text:$viewModel.email)
                    
                    Spacer()
                    
                    if(viewModel.email.count != 0) {
                        
                        Image(systemName: "checkmark")
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                    }
                    

                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black)
                )
                .padding()
                
                
                HStack {
                    Image(systemName: "lock")
                    SecureField("Password", text:$viewModel.password)
                    
                    Spacer()
                    
                    if (viewModel.password.count != 0) {
                        Image(systemName: "checkmark")
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                        }
                    
                    }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black)
                )
                .padding()
                
                Button(action: {
                    withAnimation {
                        self.currentShowingView = "signup"
                    }

                }) {
                    Text("Don't have an account?")
                        .foregroundColor(.black.opacity(0.7))
                }
                
                Spacer()
                Spacer()
                
                Button {
                    viewModel.signIn()
                } label: {
                    Text("Sign in")
                        .foregroundColor(.white)
                        .font(.title3)
                        .bold()
                    
                        .frame(maxWidth: .infinity)
                        .padding()
                    
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.black)
                                     
                        )
                        .padding(.horizontal)
                }

                
            }
        }.navigationBarBackButtonHidden(true)
    }
}

