//
//  HomeView.swift
//  FifaBattle
//
//  Created by Sharma on 01/02/2023.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.presentationMode) var presentation
    @StateObject private var viewModel: HomeViewModel = .init()
    @AppStorage("isLogged") var isLoggedIn: Bool = true
    
    var body: some View {
        NavigationView {
        
                VStack {
                    NavigationLink(destination: TableView()){
                        TableView()
                    }
                    
//                    Button {
//                        //signOut()
//                    } label: {
//                        Text("Log Out")
//                            .frame(maxWidth: .infinity)
//                            .font(.title2)
//                    }
//                    .padding()
//                    .foregroundColor(.white)
//                    .background(Color.green)
//                    .cornerRadius(16)
                }
                
            }

        .navigationBarBackButtonHidden(true)
    }
    
//    fileprivate func signOut() {
//        do {
//            try viewModel.signOut()
//            isLoggedIn.toggle()
//        } catch let signOutError as NSError {
//            print("Error signing out: %@", signOutError)
//        }
//    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
