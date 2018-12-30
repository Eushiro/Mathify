//
//  gameManager.swift
//  MathGame
//
//  Created by Hiro Ayettey on 2018-12-28.
//  Copyright © 2018 Hiro Ayettey. All rights reserved.
//

import Foundation

//Class that stores global game variables
class gameManager{
    //Session of math game
    static let game = MathGame()
    
    //High scores
    static var scores = [0,0,0,0,0]
    
    //Dictionary of game modes and corresponding high scores array index
    static var gameModes = ["Addition":0, "Subtraction":1, "Multiplication":2, "Division":3, "Random":4]
    
    //Game length
    static var seconds = 30
}
