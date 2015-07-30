//
//  Results.swift
//  RPSWithHistory
//
//  Created by Markus Willburn on 7/29/15.
//  Copyright (c) 2015 Markus Willburn. All rights reserved.
//

import Foundation

enum Results{
    case rock, paper, scissors
    
    init(){
        
        switch arc4random() % 3{
        
        case 0:
            self = .rock
        case 1:
            self = .paper
        default:
            self = .scissors
            
        }
    }
    
        func gameWinConditions(cpuChoice: Results) -> Bool{
    
            switch (self, cpuChoice){
                
            case(.rock, .paper), (.paper,.scissors), (.scissors, .rock):
                 return false
            default:
                return true
            }
        
        }

    }


extension Results: Printable {
    
    var description: String {
        get {
            switch (self) {
            case .rock:
                return "Rock"
            case .paper:
                return "Paper"
            case .scissors:
                return "Scissors"
            }
        }
    }
}
