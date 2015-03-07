//
//  SettingsViewController.swift
//  Tic Tac Toe
//
//  Created by Tobias Schmücker on 07.03.15.
//  Copyright (c) 2015 Tobias S. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var mainView: UIView!
  
    let tapRecognizer = UITapGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //var recognizer = UIGestureRecognizer(target: mainView, action: "unwindSegue:")
        tapRecognizer.addTarget(self, action: "unwindSegue:")
        mainView.addGestureRecognizer(tapRecognizer)
        mainView.userInteractionEnabled = true
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func unwindSegue(sender:AnyObject) {
        println("unwind")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
