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
    
    @IBOutlet private var menuButtons: [UIButton]!
    
    //Sets the game type based on button click
    @IBAction private func menuButtonClick(_ sender: UIButton) {
        //Minus one since settings button is 0, and addition is 1 in menuButtons array, want addition to be gameMode 0 like in gameManager dictionary
        let buttonNumber = menuButtons.firstIndex(of: sender)! - 1
        MathGame.setGameType(userChoice: buttonNumber)
    }
    
}

