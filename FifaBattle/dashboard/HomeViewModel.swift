//
//  HomeViewModel.swift
//  FifaBattle
//
//  Created by Sharma on 02/02/2023.
//

import Foundation
import FirebaseAuth

class HomeViewModel: ObservableObject {
    var firebaseAuth: Auth
    
    init(firebaseAuth: Auth = Auth.auth()) {
        self.firebaseAuth = firebaseAuth
    }
    
    func signOut() throws {
        try firebaseAuth.signOut()
    }
}
