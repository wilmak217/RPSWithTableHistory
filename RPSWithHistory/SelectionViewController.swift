//
//  SelectionViewController.swift
//  RPSWithHistory
//
//  Created by Markus Willburn on 7/27/15.
//  Copyright (c) 2015 Markus Willburn. All rights reserved.
//

import UIKit

class SelectionViewController: UIViewController{

    @IBOutlet weak var playerSelectRock: UIButton!
    @IBOutlet weak var playerSelectPaper: UIButton!
    @IBOutlet weak var playerSelectScissors: UIButton!

    var history = [MatchHistory]()

    @IBAction func buttonChosen(sender: UIButton) {
        
        //Function that handles UIButton selection choice from user
        
        switch (sender.tag){
            
        case 1:
            
             gamePlay(Results.paper)//UIButton Paper parameter passed to gamePlay method below when pushed
            
        case 2:
            
            gamePlay(Results.scissors) // UIButton Scissors parameters passed to gamePlay method below pushed
            
        default:
            
            gamePlay(Results.rock) // UIButton Rock parameter passed to gamePlay method below pushed
            
        }
        
    }
    
    @IBAction func showHistory(sender: AnyObject) {
        
        let storyboard = self.storyboard
        let historyVC = self.storyboard?.instantiateViewControllerWithIdentifier("HistoryViewController")as! HistoryViewController
        
        historyVC.history = self.history
        
        self.presentViewController(historyVC, animated: true, completion: nil)
    }
    
    
    func gamePlay(playerSelection: Results) {
    
        let cpuChoice = Results()
        let match = MatchHistory(Player: playerSelection, CPU: cpuChoice)
        
        history.append(match)
        
        // Get the Storyboard and ResultViewController
        var storyboard = UIStoryboard (name: "Main", bundle: nil)
        var resultVC = storyboard.instantiateViewControllerWithIdentifier("ResultsViewController") as! ResultsViewController
        
        // Communicate the match to the ResultViewController
        resultVC.match = match
        
        self.presentViewController(resultVC, animated: true, completion: nil)
    
    }

}