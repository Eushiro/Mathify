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
    @IBOutlet weak var timerLabel: UILabel!
    var timer = Timer()
    
    @IBOutlet weak var backButton: UIButton!
    
    var timeOfGame = gameManager.seconds{
        didSet{
            timerLabel.text = "Time: \(timeOfGame)"
            if timeOfGame == 0{
                timer = Timer.scheduledTimer(withTimeInterval: 0, repeats: false, block: {(timer) in self.timeOfGame = 0})
                problemLabel.text = "Time's Up! \n Return to Menu."
                
            }
        }
    }
    
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
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {(timer) in self.timeOfGame -= 1})
    }
 
    @IBAction func backButtonClick(_ sender: UIButton?) {
        if(countCorrect>gameManager.scores[MathGame.getGameType()]){
            gameManager.scores[MathGame.getGameType()] = countCorrect
            }
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
