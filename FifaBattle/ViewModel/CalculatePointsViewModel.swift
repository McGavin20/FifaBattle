//
//  CalculatePointsViewModel.swift
//  FifaBattle
//
//  Created by Sharma McGavin on 15/02/2023.
//

import Foundation

func calculatePoints(wins: Int, draws: Int, losses: Int) -> Int {
    var score = 0
    score += (wins * 3)  // add points for wins
    score += draws       // add points for draws
    // losses are not considered since they do not contribute to the score
    return score
}

//Points
func calculateScore(playerGoals: Int, opponentGoals: Int) -> Int {
    if playerGoals > opponentGoals {
        // player wins
        return 3
    } else if playerGoals == opponentGoals {
        // draw
        return 1
    } else {
        // player loses
        return 0
    }
}
