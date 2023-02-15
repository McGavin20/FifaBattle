//
//  TableView.swift
//  FifaBattle
//
//  Created by Sharma McGavin on 09/02/2023.
//

import SwiftUI

struct Player: Identifiable {
    var id = UUID()
    var name: String
    var goals: Int
    var points: Int
}

struct TableView: View {
    
    var players = [
        Player(name: "John", goals: 10, points: 30),
        Player(name: "Sarah", goals: 5, points: 15),
        Player(name: "David", goals: 3, points: 9)
    ]
    
    var body: some View {
        
            VStack {
                HStack {
                    Text("Name")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.green)
                    Text("Goals")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.green)
                    Text("Points")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.green)
                }
                .font(.headline)
                .padding()
                
                List(players) { player in
                    ZStack {
                        Color.black
                        
                        HStack {
                            Text(player.name)
                                .frame(maxWidth: .infinity)
                                .foregroundColor(Color.gray)
                            
                            Text("\(player.goals)")
                                .frame(maxWidth: .infinity)
                                .foregroundColor(Color.gray)
                            Text("\(player.points)")
                                .frame(maxWidth: .infinity)
                                .foregroundColor(Color.gray)
                            
                        }
                    }
                }
                .listStyle(.plain)
                .background(Color.black)
            }
    }
}



