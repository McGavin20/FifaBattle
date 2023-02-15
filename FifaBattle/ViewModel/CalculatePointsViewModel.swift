//
//  CalculatePointsViewModel.swift
//  FifaBattle
//
//  Created by Sharma McGavin on 15/02/2023.
//

import Foundation

func calculateScore(wins: Int, draws: Int, losses: Int) -> Int {
    var score = 0
    score += (wins * 3)  // add points for wins
    score += draws       // add points for draws
    // losses are not considered since they do not contribute to the score
    return score
}
