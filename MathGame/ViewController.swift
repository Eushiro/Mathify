//
//  ViewController.swift
//  MathGame
//
//  Created by Hiro Ayettey on 2018-12-27.
//  Copyright © 2018 Hiro Ayettey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet var menuButtons: [UIButton]!
    
    @IBAction func menuButtonClick(_ sender: UIButton) {
        let buttonNumber = menuButtons.firstIndex(of: sender)!
        MathGame.setGameType(userChoice: buttonNumber)
    }
    
}

