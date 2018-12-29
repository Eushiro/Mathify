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
    static var secondNum = 0
    
    func calculateAnswer(generatedType:Int)->Int{
        switch generatedType {
        case 4:
            return MathGame.firstNum + MathGame.secondNum
        case 3:
            return MathGame.firstNum - MathGame.secondNum
        case 2:
            return MathGame.firstNum * MathGame.secondNum
        case 1:
            return MathGame.firstNum * MathGame.secondNum / MathGame.secondNum
        default:
            return 0
        }
    }
    
    static func setGameType(userChoice:Int){
        gameType = userChoice
    }
    
    static func getGameType()->Int{
        return gameType
    }
    
    func generateProblemString(generatedType: Int)->String{
        switch generatedType {
        case 4:
            return "\(MathGame.firstNum) + \(MathGame.secondNum) = ?"
        case 3:
            return "\(MathGame.firstNum) - \(MathGame.secondNum) = ?"
        case 2:
            return "\(MathGame.firstNum) x \(MathGame.secondNum) = ?"
        case 1:
            return "\(MathGame.firstNum * MathGame.secondNum) ÷ \(MathGame.secondNum) = ?"
        default:
            return "Error Occured"
        }
    }
    
    func generateProblem()->String{
        MathGame.firstNum = Int.random(in: 10...20)
        MathGame.secondNum = Int.random(in: 1...10)
        
        if MathGame.gameType == 0 {
            let randomType = Int.random(in: 1...4)
            MathGame.answer = calculateAnswer(generatedType: randomType)
            return generateProblemString(generatedType: randomType )
        }
        else{
            MathGame.answer = calculateAnswer(generatedType: MathGame.gameType)
            return generateProblemString(generatedType: MathGame.gameType)

        }
    }
    
    func checkAnswer(userInput: Int)->Bool{
        if userInput == MathGame.answer{
            return true
        }
        else{
            return false
        }
    }
    
}
