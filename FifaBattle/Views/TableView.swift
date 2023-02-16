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
    @StateObject private var viewModel: HomeViewModel = .init()
    @AppStorage("isLogged") var isLoggedIn: Bool = true
    
    let players = [
        Player(name: "John", goals: 10, points: 30),
        Player(name: "Sarah", goals: 5, points: 15),
        Player(name: "David", goals: 3, points: 9)
    ]
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            NavigationView {
                
                VStack {
                    ScrollView {
                        VStack {
                            HStack {
                                Text("Name")
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.green)
                                    .font(.headline)
                                Text("Score")
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.green)
                                    .font(.headline)
                                Text("Points")
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.green)
                                    .font(.headline)
                            }
                            ForEach(players) { player in
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
                        }
                        .frame(width: 350, height: 100)
                    }
                    //NavigationLink()
//                    Button(action: {
//                        navigateToNextScreen = true
//                    }, label: {
//                        Image(systemName: "plus")
//                    })
//                    NavigationLink(destination: IncrementNumberButton(), isActive: $navigateToNextScreen) {
//                        EmptyView()
//                    }
                    //.hidden()
                }
                .navigationTitle("Fifa Battle Table")
                .navigationBarItems(
                    leading:
                        NavigationLink(destination: IncrementNumberButton(), isActive: $navigateToNextScreen) {
                                Image(systemName: "plus")
                            },
                    trailing:
                        Button(action: {
                            // Handle action
                            signOut()
                        }, label: {
                            Text("Log Out")
                                .foregroundColor(.green)
                        })
                )
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
        .environment(\.colorScheme, .dark)
    }
    fileprivate func signOut() {
        do {
            try viewModel.signOut()
            isLoggedIn.toggle()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}
