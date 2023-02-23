//
//  IncrementNumberButton.swift
//  FifaBattle
//
//  Created by Sharma McGavin on 15/02/2023.
//

import SwiftUI
class Scores: ObservableObject {
    @Published var playerGoals = 0
    @Published var opponentGoals = 0
}
struct IncrementNumberButton: View {
    @StateObject var score = Scores()
    
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
                        Text("Player Goals: \(score.playerGoals)")
                            .foregroundColor(.gray)
                        Stepper("", value: $score.playerGoals, in: 0...20)
                            .foregroundColor(.gray)
                    }
                    .padding()
                    HStack {
                        Text("Opponent Goals: \(score.opponentGoals)")
                            .foregroundColor(.gray)
                        Stepper("", value: $score.opponentGoals, in: 0...20)
                            .foregroundColor(.gray)
                    }
                    .padding()
                    NavigationLink(destination: TableView()) {
                        Text("Confirm")
                            .font(.title)
                            .frame(width: 180, height: 50)
                            .background(Color.green)
                            .opacity(0.8)
                            .cornerRadius(12)
                            .foregroundColor(.black)
                            .bold()
                    }
                }
                .ignoresSafeArea()
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
