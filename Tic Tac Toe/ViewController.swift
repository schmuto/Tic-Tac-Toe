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
    
    // 0 = empty, 1 = circle, 2 = cross
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]

    @IBOutlet weak var button0: UIButton!
    
    @IBAction func buttonPressed(sender: UIButton) {
        
        if (gameState[sender.tag]==0) {
            
        
        var image = UIImage()
        
        if (goNumber%2 == 0) {
            
            image = UIImage(named: "cross.png")!
            gameState[sender.tag] = 2
            
        } else {
            
            image = UIImage(named: "circle.png")!
            gameState[sender.tag] = 1
            
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


}

