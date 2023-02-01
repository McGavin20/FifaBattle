//
//  HomeView.swift
//  FifaBattle
//
//  Created by Sharma on 01/02/2023.
//

import SwiftUI
import FirebaseAuth

struct HomeView: View {
    @Environment(\.presentationMode) var presentation
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                Text("✅User is logged in.")
                    .foregroundColor(Color.white)
                    .padding()
        
                
                Button {
                    let firebaseAuth = Auth.auth()
                    do {
                        try firebaseAuth.signOut()
                        presentation.wrappedValue.dismiss()
                    } catch let signOutError as NSError {
                        print("Error signing out: %@", signOutError)
                    }
                    
                } label: {
                    Text("Log Out")
                        .frame(maxWidth: .infinity)
                        .font(.title2)
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.green)
                .cornerRadius(16)
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
