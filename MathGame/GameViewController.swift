//
//  GameViewController.swift
//  MathGame
//
//  Created by Hiro Ayettey on 2018-12-28.
//  Copyright © 2018 Hiro Ayettey. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var problemLabel: UILabel!
    @IBOutlet weak var userInputLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    var countCorrect = 0 {
        didSet{
            scoreLabel.text = "Score: \(countCorrect)"
        }
    }
    var userInput = "" {
        didSet{
            userInputLabel.text = "\(userInput)"
        }
    }
    
    var problemString = ""{
        didSet{
            problemLabel.text = "\(problemString)"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        problemString = gameManager.game.generateProblem()
        userInput = ""
    }
    
    
    @IBOutlet var inputButtons: [UIButton]!
    
    
    @IBAction func inputButtonClicked(_ sender: UIButton) {

        let buttonIndex = inputButtons.firstIndex(of: sender)!
        if buttonIndex == 10{
            userInput = ""
        }
        else if buttonIndex == 11{
            var isCorrect = false
            isCorrect = gameManager.game.checkAnswer(userInput: Int(userInput) ?? -1)
            if(isCorrect){
                problemString = gameManager.game.generateProblem()
                countCorrect += 1
                userInput = ""
            }
            else{
                userInput = ""
            }
        }
        else{
            userInput.append(String(buttonIndex))
        }
    }
 

}
