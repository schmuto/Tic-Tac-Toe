//
//  SettingsViewController.swift
//  Tic Tac Toe
//
//  Created by Tobias Schmücker on 07.03.15.
//  Copyright (c) 2015 Tobias S. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBAction func openIcons8Website(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string:"http://icons8.com")!)
    }
    
    @IBOutlet weak var blueButton: UIButton!
    
    @IBOutlet weak var greenButton: UIButton!
    
    @IBOutlet weak var orangeButton: UIButton!
    
    @IBOutlet weak var pinkButton: UIButton!
    
    
    
    @IBAction func panned(sender: AnyObject) {
        applyColor("")
    }
    
    @IBAction func tappedBlue(sender: AnyObject) {
        returnButtonsToNormal()
        blueButton.setImage(UIImage(named: "bg_button_blue_pressed"), forState: .Normal)
        applyColor("blue")
    }
    
    @IBAction func tappedGreen(sender: AnyObject) {
        returnButtonsToNormal()
        greenButton.setImage(UIImage(named: "bg_button_green_pressed"), forState: .Normal)
        applyColor("green")
    }
    
    @IBAction func tappedOrange(sender: AnyObject) {
        returnButtonsToNormal()
        orangeButton.setImage(UIImage(named: "bg_button_orange_pressed"), forState: .Normal)
        applyColor("orange")
    }
    
    @IBAction func tappedPink(sender: AnyObject) {
        returnButtonsToNormal()
        pinkButton.setImage(UIImage(named: "bg_button_pink_pressed"), forState: .Normal)
        applyColor("pink")
    }
    
    @IBAction func tappedUnwindSegue(sender: AnyObject) {
        applyColor("")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var currentColor: String = NSUserDefaults.standardUserDefaults().objectForKey("bgColor") as String
        switch currentColor {
            case "blue": blueButton.setImage(UIImage(named: "bg_button_blue_pressed"), forState: .Normal)
            case "green": greenButton.setImage(UIImage(named: "bg_button_green_pressed"), forState: .Normal)
            case "orange": orangeButton.setImage(UIImage(named: "bg_button_orange_pressed"), forState: .Normal)
            case "pink": pinkButton.setImage(UIImage(named: "bg_button_pink_pressed"), forState: .Normal)
        default:  break
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func returnButtonsToNormal() {
        for button in [blueButton, greenButton, orangeButton, pinkButton] {
            button.setImage(UIImage(named: "bg_button_\(button.titleLabel?.text)"), forState: .Normal)
        }
        
    }
    
    
    func applyColor(color:String) {
        if color.isEmpty == false {
            NSUserDefaults.standardUserDefaults().setObject(color, forKey: "bgColor")
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
