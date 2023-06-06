//
//  ProfileView.swift
//  ILoveWorkout
//
//  Created by Jonas Backas on 2023-01-23.
//

import SwiftUI
import Firebase
import FirebaseAuth
import Charts

struct ProfileView: View {
    @ObservedObject var viewModel = ProfileViewModel()
    
    var body: some View {
        VStack {
            TopNavigationBarView
            Spacer()
            BarChartsView()
            
            GeometryReader { proxy in
                TabView(selection: $viewModel.currentIndex) {
                    ForEach(0..<viewModel.numberOfImages) { num in
                        Image("\(num)")
                            .resizable()
                            .scaledToFill()
                            .overlay(Color.black.opacity(0.4))
                            .tag(num)
                    }
                }.tabViewStyle(PageTabViewStyle())
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .padding()
                    .frame(width: proxy.size.width, height:
                            proxy.size.height / 1)
                    .onReceive(viewModel.timer, perform: { _ in
                        viewModel.next()
                        
                        })
                
            }
            controls
            Spacer()
            Spacer()
            
        }
        
    }
    
    
    
    var controls: some View {
        HStack {
            Button {
                viewModel.previous()
            } label: {
                Image(systemName: "chevron.left")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
            Button {
                viewModel.next()
            } label: {
                Image(systemName: "chevron.right")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
            }
        }
    }
    
    private var TopNavigationBarView: some View {
        HStack(spacing: 16) {
            
            Image(systemName: "person.fill")
                .font(.system(size: 64))
                .padding()
                .foregroundColor(Color(.label))
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Welcome")
                    .font(.system(size: 24, weight: .bold))
                
                    HStack {
                    Circle()
                        .foregroundColor(.green)
                        .frame(width: 14, height: 14)
                    Text("Online")
                        .font(.system(size: 15))
                        .foregroundColor(Color(.lightGray))
                }
            }
            
            Spacer()
            Button {
                viewModel.logoutOptions.toggle()
            } label: {
                Image(systemName: "gear")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(Color(.label))
                Text("Logout")
                    .font(.system(size: 12))
                    .foregroundColor(Color(.lightGray))
            }
        }
        .padding()
        .actionSheet(isPresented: $viewModel.logoutOptions) {
            .init(title: Text("Alert"), message: Text("Do you want to logout?"), buttons: [
                .destructive(Text("Sign out"), action: {
                    viewModel.signOut()
                }),
                .cancel()
             ])
        }

    }
    
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
