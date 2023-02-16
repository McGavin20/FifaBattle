//
//  IncrementNumberButton.swift
//  FifaBattle
//
//  Created by Sharma McGavin on 15/02/2023.
//

import SwiftUI

struct IncrementNumberButton: View {
    @State private var youNumber = 0
    @State private var opponentNumber = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.green, .white, .black]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                VStack {
                    Text("You:")
                        .font(.title)
                        .bold()
                    HStack {
                        Button(action: {
                            youNumber -= 1
                        }, label: {
                            Image(systemName: "minus.circle")
                                .foregroundColor(.red)
                        })
                        Text("\(youNumber)")
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.blue, lineWidth: 2)
                            )
                        Button(action: {
                            youNumber += 1
                        }, label: {
                            Image(systemName: "plus.circle")
                                .foregroundColor(.green)
                        })
                    }
                    Spacer()
                    Text("Opponent:")
                        .font(.title)
                        .bold()
                    HStack {
                        Button(action: {
                            opponentNumber += 1
                        }, label: {
                            Image(systemName: "minus.circle")
                                .foregroundColor(.red)
                        })
                        Text("\(opponentNumber)")
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.blue, lineWidth: 2)
                            )
                        Button(action: {
                            opponentNumber -= 1
                        }, label: {
                            Image(systemName: "plus.circle")
                                .foregroundColor(.green)
                        })
                    }
                    Spacer()
                    NavigationLink(destination: HomeView()) {
                        Text("Confirm")
                            .font(.largeTitle)
                            .bold()
                    }
                }
                .navigationTitle("Score:")
            }
            .navigationBarHidden(true)

        }
        .navigationBarBackButtonHidden(true)
    }
}


struct IncrementNumberButton_Previews: PreviewProvider {
    static var previews: some View {
        IncrementNumberButton()
    }
}
