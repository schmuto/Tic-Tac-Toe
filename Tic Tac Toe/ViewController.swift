//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Tobias Schmücker on 06.03.15.
//  Copyright (c) 2015 Tobias Schmücker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var goNumber = 1
    
    var winner = 0
    
    let winnerNames = ["null", "Circle", "Cross"]
    
    // 0 = empty, 1 = circle, 2 = cross
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4, 8], [2,4,6]]

    @IBOutlet weak var button0: UIButton!
    
    @IBAction func buttonPressed(sender: UIButton) {
        
        if (gameState[sender.tag]==0 && winner == 0) {
            
        
            var image = UIImage()
        
            if (goNumber%2 == 0) {
            
                image = UIImage(named: "cross.png")!
                gameState[sender.tag] = 2
            
            } else {
            
                image = UIImage(named: "circle.png")!
                gameState[sender.tag] = 1
            
            }
        
            
            for combination in winningCombinations {
                
                if (gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] && gameState[combination[0]] != 0) {
                    
                    winner = gameState[combination[0]]
                    
                }
                
            }
            
            if (winner != 0) {
                let playAgainAction = UIAlertAction(title: "Let's play again!", style: .Default) { (action) in
                    self.resetGame()
                }
                let alertController = UIAlertController(title: "We have a winner!", message: "\(winnerNames[winner]) wins.", preferredStyle: .Alert)
                alertController.addAction(playAgainAction)
                self.presentViewController(alertController, animated: true) {
                    
                }
            }
            
            goNumber++;
        
            sender.setImage(image, forState: .Normal)
            
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func resetGame() {
        goNumber = 1
        winner = 0
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        //starting with 0 in the for loop causes a crash
        button0.setImage(nil, forState: .Normal)
        for (var i = 1; i<=8; i++) {
            var button:UIButton = view.viewWithTag(i) as UIButton
            button.setImage(nil, forState: .Normal)
        }
    }
    
    
}

