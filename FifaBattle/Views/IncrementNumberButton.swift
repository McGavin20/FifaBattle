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
                
                Color(.black)
                    .edgesIgnoringSafeArea(.all)
                ZStack {
                    //Neumorphism Frame
                    Color(.black)
                        .frame(width: 380, height: 460, alignment: .center)
                        .cornerRadius(20)
                        .shadow(color: .theme.primaryColor.opacity(0.3), radius: 8, x: -8, y: -8)
                        .shadow(color: .theme.primaryColor.opacity(0.3), radius: 8, x: 8, y: 8)
                    VStack {
                        Image("sign-in-logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 180, height: 180)
                            .foregroundColor(.theme.primaryColor)
                            .offset(y: -20)
                        
                        
                        VStack {
                            HStack {
                                Text("Player Goals: \(score.playerGoals)")
                                    .foregroundColor(.theme.darkGray)
                                Stepper("", value: $score.playerGoals, in: 0...20)
                                    .foregroundColor(.theme.primaryColor)
                            }
                            .padding()
                            HStack {
                                Text("Opponent Goals: \(score.opponentGoals)")
                                    .foregroundColor(.theme.darkGray)
                                Stepper("", value: $score.opponentGoals, in: 0...20)
                                    .foregroundColor(.theme.whiteGray)
                            }
                            .padding()
                        }
                        .offset(y: -20)
                        
                        Button(action: {
                            //Send results to database and update the Tableview points
                            print("⚽️Results recorded!")
                        }) {
                            Capsule()
                                .fill(Color.theme.background)
                                .frame(width: 200, height: 50)
                                .overlay(
                                    Text("Press me")
                                        .foregroundColor(.theme.primaryColor)
                                )
                        }
                    }
                }
            }
            .ignoresSafeArea()
            //.navigationTitle("Score:")
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
