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
            NavigationView {
                ScrollView {
                    VStack {
                        Text("Fifa Battle Table")
                            .font(.custom(FontsManager.Fonts.gameFont2, size:  17)).bold()
                            .foregroundColor(.theme.lightGray)
                            //.offset(y: -6)
                        HStack {
                            Text("Name")
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.theme.primaryColor)
                                .font(.headline)
                            Text("Goals")
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.theme.primaryColor)
                                .font(.headline)
                            Text("Points")
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.theme.primaryColor)
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
                            .foregroundColor(.theme.lightGray)
                            .frame(width: 350, height: 100)
                        }
                        CreditsView()
                            .modifier(CenterModifier())
                    }
                    
                }
                .offset(y: -18)
                .fixedSize(horizontal: false, vertical: true)
            }
            .navigationBarBackButtonHidden(true)
        }
        .environment(\.colorScheme, .dark)
    }
    
    private func signOut() {
        do {
            try viewModel.signOut()
            isLoggedIn.toggle()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}
