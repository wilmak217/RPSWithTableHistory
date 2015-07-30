//
//  MatchHistory.swift
//  RPSWithHistory
//
//  Created by Markus Willburn on 7/28/15.
//  Copyright (c) 2015 Markus Willburn. All rights reserved.
//

import Foundation

struct MatchHistory{
    
    let Player: Results
    let CPU: Results
    let date: NSDate
    
    init (Player: Results, CPU: Results) {
    
       self.Player = Player
       self.CPU = CPU
       self.date = NSDate()
    }
    
    var winner: Results{
        
      get{return Player.gameWinConditions(CPU) ? Player : CPU}
    }
    
    var loser: Results{
    
      get{return Player.gameWinConditions(CPU) ? CPU : Player}
    }
}