//
//  GameViewController.swift
//  MathGame
//
//  Created by Hiro Ayettey on 2018-12-28.
//  Copyright © 2018 Hiro Ayettey. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    //View Objects
    @IBOutlet weak var problemLabel: UILabel!
    @IBOutlet weak var userInputLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet var inputButtons: [UIButton]!
    private var timer = Timer()
    
    @IBOutlet weak var backButton: UIButton!
    
    //Time left in gameplay, along with game over
    private var timeOfGame = gameManager.seconds{
        didSet{
            timerLabel.text = "Time: \(timeOfGame)"
            if timeOfGame == 0{
                timer = Timer.scheduledTimer(withTimeInterval: 0, repeats: false, block: {(timer) in self.timeOfGame = 0})
                problemLabel.text = "Time's Up! \n Return to Menu."
                userInputLabel.text = ""
                for button in inputButtons{
                    button.isEnabled = false
                }
            }
        }
    }
    
    //Values that change label texts
    private var countCorrect = 0 {
        didSet{
            scoreLabel.text = "Score: \(countCorrect)"
        }
    }
    private var userInput = "" {
        didSet{
            userInputLabel.text = "\(userInput)"
        }
    }
    
    private var problemString = ""{
        didSet{
            problemLabel.text = "\(problemString)"
        }
    }
    
    //Starts the timer when view loads
    //Sorts the buttons so that inputButtonsClicked function works properly
    override func viewDidLoad() {
        super.viewDidLoad()

        problemString = gameManager.game.generateProblem()
        userInput = ""
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {(timer) in self.timeOfGame -= 1})
        inputButtons.sort { (UIButton, UIButton2) -> Bool in {return UIButton.currentTitle!.lexicographicallyPrecedes(UIButton2.currentTitle!) }()
        }
        
    }
 
    //If your score is greater than previous scores, updates it when you go back to menu
    @IBAction func backButtonClick(_ sender: UIButton?) {
        if(countCorrect>gameManager.scores[MathGame.getGameType()]){
            gameManager.scores[MathGame.getGameType()] = countCorrect
            }
    }
    
    //Captures user input based on button click, 10 is clear input, 11 is enter
    //0-9 are text inputs which get converted to integers when enter is pressed
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
