//
//  MathGameModel.swift
//  MathGame
//
//  Created by Hiro Ayettey on 2018-12-28.
//  Copyright © 2018 Hiro Ayettey. All rights reserved.
//

import Foundation

class MathGame{
    
    static var gameType = 0
    static var input = 0
    static var answer = 0
    static var firstNum = 0
    //Use random limits to control difficulty of randomly generated problems
    static var randomLimits = ["firstNumLowerBound":10, "firstNumUpperBound": 20, "secondNumLowerBound":1, "secondNumUpperBound":10]
    static var secondNum = 0
    
    //Calculates answer for generated question, takes in the game mode type as a parameter
    func calculateAnswer(generatedType:Int)->Int{
        switch generatedType {
        case gameManager.gameModes["Addition"]:
            return MathGame.firstNum + MathGame.secondNum
        case gameManager.gameModes["Subtraction"]:
            return MathGame.firstNum - MathGame.secondNum
        case gameManager.gameModes["Multiplication"]:
            return MathGame.firstNum * MathGame.secondNum
        case gameManager.gameModes["Division"]:
            return MathGame.firstNum * MathGame.secondNum / MathGame.secondNum
        default:
            return 0
        }
    }
    
    //Sets the game type
    static func setGameType(userChoice:Int){
        gameType = userChoice
    }
    
    //Gets the game type
    static func getGameType()->Int{
        return gameType
    }
    
    //Takes in the randomly generated numbers and creates the string that is displayed in the question label
    func generateProblemString(generatedType: Int)->String{
        switch generatedType {
        case gameManager.gameModes["Addition"]:
            return "\(MathGame.firstNum) + \(MathGame.secondNum) = ?"
        case gameManager.gameModes["Subtraction"]:
            return "\(MathGame.firstNum) - \(MathGame.secondNum) = ?"
        case gameManager.gameModes["Multiplication"]:
            return "\(MathGame.firstNum) x \(MathGame.secondNum) = ?"
        case gameManager.gameModes["Division"]:
            return "\(MathGame.firstNum * MathGame.secondNum) ÷ \(MathGame.secondNum) = ?"
        default:
            return "Error Occured"
        }
    }
    
    //Randomly generates two numbers. If it is the random game mode (gameType = 0) then a random game mode is chosen and passed to calculateAnswer and generateProblemString
    func generateProblem()->String{
        
        MathGame.firstNum = Int.random(in: MathGame.randomLimits["firstNumLowerBound"]!...MathGame.randomLimits["firstNumUpperBound"]!)
        MathGame.secondNum = Int.random(in: MathGame.randomLimits["secondNumLowerBound"]!...MathGame.randomLimits["secondNumUpperBound"]!)
        
        if MathGame.gameType == gameManager.gameModes["Random"] {
            let randomType = Int.random(in: gameManager.gameModes["Addition"]!...gameManager.gameModes["Division"]!)
            MathGame.answer = calculateAnswer(generatedType: randomType)
            return generateProblemString(generatedType: randomType )
        }
        else{
            MathGame.answer = calculateAnswer(generatedType: MathGame.gameType)
            return generateProblemString(generatedType: MathGame.gameType)

        }
    }
    
    //Checks if the players answer is correct
    func checkAnswer(userInput: Int)->Bool{
        return userInput == MathGame.answer ? true : false
    }
    
}
