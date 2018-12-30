//
//  SettingsViewController.swift
//  MathGame
//
//  Created by Hiro Ayettey on 2018-12-28.
//  Copyright © 2018 Hiro Ayettey. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //Number of rows in high schore table, one for each mode
    var tableViewRows = 5
    @IBOutlet weak var timeSliderObject: UISlider!
    @IBOutlet weak var timeDisplayLabel: UILabel!
    
    //Sets the number of rows to be displayed in the high scores table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewRows
    }
    
    //Generates the strings that are displayed in high score table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Addition: " + String(gameManager.scores[gameManager.gameModes["Addition"]!])
            break
        case 1:
            cell.textLabel?.text = "Subtraction: " + String(gameManager.scores[gameManager.gameModes["Subtraction"]!])
            break
        case 2:
            cell.textLabel?.text = "Multiplication: " + String(gameManager.scores[gameManager.gameModes["Multiplication"]!])
            break
        case 3:
            cell.textLabel?.text = "Division: " + String(gameManager.scores[gameManager.gameModes["Division"]!])
            break
        case 4:
            cell.textLabel?.text = "Random: " + String(gameManager.scores[gameManager.gameModes["Random"]!])
            break
        default:
            cell.textLabel?.text = "0"
        }
        cell.backgroundColor = #colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1)
        return cell
    }
    
    //Uses the slider to set game length time
    @IBAction func timeSlider(_ sender: UISlider) {
        gameManager.seconds = Int(sender.value)
        timeDisplayLabel.text = String(gameManager.seconds)
    }
   
    //Sets the slider value and game length label to current game length
    override func viewDidLoad() {
        super.viewDidLoad()
        timeSliderObject.value = Float(gameManager.seconds)
        timeDisplayLabel.text = String(gameManager.seconds)
        
    }
    
}
