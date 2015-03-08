//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Tobias Schmücker on 06.03.15.
//  Copyright (c) 2015 Tobias Schmücker. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var goNumber = 1
    
    var winner = 0
    
    var draw = false
    
    let winnerNames = ["null", "Filled Circle", "Empty Circle"]
    
    var backgroundColor = "orange"
    
    // 0 = empty, 1 = circle, 2 = cross
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4, 8], [2,4,6]]

    @IBOutlet weak var button0: UIButton!
    
    @IBOutlet weak var bgView: UIImageView!
    
    
    @IBAction func buttonPressed(sender: UIButton) {
        
        // if button hasn't been pressed and there's no winner
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
    
            UIView.transitionWithView(sender, duration: 0.2, options: .TransitionCrossDissolve, animations: { sender.setImage(image, forState: .Normal) }, completion: nil)
            sender.userInteractionEnabled = false
            
            //if game ended in a draw
            
            
            if (goNumber >= 10 && winner == 0) {
                let playAgainAction = UIAlertAction(title: "Let's play again!", style: .Default) { (action) in
                        self.resetGame()
                }
                let alertController = UIAlertController(title: "We have a tie!", message: "", preferredStyle: .Alert)
                alertController.addAction(playAgainAction)
                self.presentViewController(alertController, animated: true) {
                }
            }
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var bgColorFromStorage = NSUserDefaults.standardUserDefaults().stringForKey("bgColor")
        if (bgColorFromStorage != nil)  {
            backgroundColor = NSUserDefaults.standardUserDefaults().stringForKey("bgColor")!
            updateBackgroundColor()
        } else {
            backgroundColor = "orange"
            NSUserDefaults.standardUserDefaults().setObject(backgroundColor, forKey: "bgColor")
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func viewDidAppear(animated: Bool) {
        if (backgroundColor != NSUserDefaults.standardUserDefaults().objectForKey("bgColor") as String) {
            updateBackgroundColor()
        }
    }
    
    
    func resetGame() {
        goNumber = 1
        winner = 0
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        //starting with 0 in the for loop causes a crash
        button0.setImage(nil, forState: .Normal)
        UIView.transitionWithView(button0, duration: 0.2, options: .TransitionCrossDissolve, animations: { self.button0.setImage(nil, forState: .Normal) }, completion: nil)
        button0.userInteractionEnabled = true
        
        for (var i = 1; i<=8; i++) {
            var button:UIButton = view.viewWithTag(i) as UIButton
            UIView.transitionWithView(button, duration: 0.2, options: .TransitionCrossDissolve, animations: { button.setImage(nil, forState: .Normal) }, completion: nil)
            button.userInteractionEnabled = true
        }
    }
    
    
    func updateBackgroundColor() {
        backgroundColor = NSUserDefaults.standardUserDefaults().objectForKey("bgColor") as String
        let animationOptions = UIViewAnimationOptions.TransitionCrossDissolve
        UIView.transitionWithView(bgView, duration: 0.5, options: animationOptions, animations:{self.bgView.image=UIImage(named: "bg_\(self.backgroundColor)")}, completion: nil)
    }
    
}

