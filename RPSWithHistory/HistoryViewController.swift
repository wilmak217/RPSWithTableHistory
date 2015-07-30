//
//  HistoryViewController.swift
//  RPSWithHistory
//
//  Created by Markus Willburn on 7/28/15.
//  Copyright (c) 2015 Markus Willburn. All rights reserved.
//

import Foundation
import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var eraseTable: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var history: [MatchHistory]!
    
    
    @IBAction func backTrack(sender: AnyObject){
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) ->Int {
        
        return history.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cellInd = "playerHistory"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellInd, forIndexPath: indexPath) as! UITableViewCell
        
        let match = self.history[indexPath.row]
        
        cell.textLabel!.text = victoryMessage(match)
        cell.detailTextLabel!.text = "\(match.Player) vs. \(match.CPU)"
        /*cell.imageView.image = */
        
        return cell
        
    }
    
    func victoryMessage(match: MatchHistory) -> String{
    
        if (match.Player == match.CPU){
            
            return "Tie."
        
        }
        else if (match.Player .gameWinConditions(match.CPU)){
            return "Win!"
        }
        else{
    
            return "Loss."
    
        }
    
    }
    
    
}

