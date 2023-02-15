//
//  TableView.swift
//  FifaBattle
//
//  Created by Sharma McGavin on 09/02/2023.
//

import Foundation
import SwiftUI

struct Player: Identifiable {
    var id = UUID()
    var name: String
    var goals: Int
    var points: Int
}

struct DetailView: View {
    let player: Player
    
    var body: some View {
        Text(player.name)
    }
}

struct TableView: View {
    @State private var navigateToNextScreen = false
    
    let players = [
        Player(name: "John", goals: 10, points: 30),
        Player(name: "Sarah", goals: 5, points: 15),
        Player(name: "David", goals: 3, points: 9)
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                List(players) { player in
                    NavigationLink(destination: DetailView(player: player)) {
                        HStack {
                            Text(player.name)
                                .frame(maxWidth: .infinity)
                            Text("\(player.goals)")
                                .frame(maxWidth: .infinity)
                            Text("\(player.points)")
                                .frame(maxWidth: .infinity)
                        }
                    }
                }
                Button(action: {
                    navigateToNextScreen = true
                }, label: {
                    Image(systemName: "plus")
                })
                NavigationLink(destination: IncrementNumberButton(), isActive: $navigateToNextScreen) {
                    EmptyView()
                }
                .hidden()
            }
            .navigationTitle("Fifa Battle Table")
        }
    }
}
