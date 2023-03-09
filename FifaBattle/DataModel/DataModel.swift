//
//  DataModel.swift
//  FifaBattle
//
//  Created by Sharma McGavin on 06/03/2023.
//

import SwiftUI
import Firebase

struct ScoreRecord: Identifiable {
    var id: String
    var name: String
    var goals: Int
    var points: Int
}
