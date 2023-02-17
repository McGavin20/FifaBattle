//
//  IncrementNumberButton.swift
//  FifaBattle
//
//  Created by Sharma McGavin on 15/02/2023.
//

import SwiftUI

struct IncrementNumberButton: View {
    @State private var playerGoals = 0
    @State private var opponentGoals = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.green
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.black.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.black)
                VStack {
                    HStack {
                        Text("Player Goals: \(playerGoals)")
                            .foregroundColor(.gray)
                        Stepper("", value: $playerGoals, in: 0...20)
                            .foregroundColor(.gray)
                    }
                    .padding()
                    HStack {
                        Text("Opponent Goals: \(opponentGoals)")
                            .foregroundColor(.gray)
                        Stepper("", value: $opponentGoals, in: 0...20)
                            .foregroundColor(.gray)
                    }
                    .padding()
                    NavigationLink(destination: HomeView()) {
                        Text("Confirm")
                            .font(.title)
                            .frame(width: 180, height: 50)
                            .background(Color.green)
                            .cornerRadius(12)
                            .foregroundColor(.black)
                            .bold()
                    }
                }
            }
            .navigationTitle("Score:")
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}



struct IncrementNumberButton_Previews: PreviewProvider {
    static var previews: some View {
        IncrementNumberButton()
    }
}
