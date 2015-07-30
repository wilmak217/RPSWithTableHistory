//
//  ResultsViewController.swift
//  RPSWithHistory
//
//  Created by Markus Willburn on 7/27/15.
//  Copyright (c) 2015 Markus Willburn. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController{

    @IBOutlet weak var gameResults: UIImageView!
    @IBOutlet weak var gameMessage: UILabel!

    var match: MatchHistory!
    
    var message: NSString!
    var picture: UIImage!
    
    override func viewWillAppear(animated: Bool){
    
        super.viewWillAppear(animated)
        self.gameMessage.text = matchResult(match)
        self.gameResults.image = outcomeImage(match)
        
    }
    
    
    @IBAction func playAgain(sender: AnyObject) {
    
        dismissViewControllerAnimated(true, completion:nil)
    
}
    
    func matchResult(match: MatchHistory) -> String{
        
        if match.Player == match.CPU{
            return "It's a tie!"
        }
        else{
            return match.Player.gameWinConditions(match.CPU) ? "You Win!" : "You Lose!"
        }
    }
    
    func victoryMessage(outcome: Results) -> String{
        
        switch(outcome){
            
        case .rock:
            
            return "crushes"
            
        case .paper:
            
            return "covers"
            
        case .scissors:
            
            return "cuts"
        }
        
    }
    
    func outcomeImage(match: MatchHistory) -> UIImage{
    
        var name = ""
        
        if match.Player == match.CPU{
            
            name = "tie"
        }
        else{
        
           switch (match.winner){
        
           case .rock:
            
            name = "rock-scissors"
        
           case .paper:
            
            name = "paper-rock"
            
           case .scissors:
        
            name = "scissors-paper"

            }
        }
        
        return UIImage(named: name)!
    }
    
}
