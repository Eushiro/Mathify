//
//  SettingsViewController.swift
//  MathGame
//
//  Created by Hiro Ayettey on 2018-12-28.
//  Copyright © 2018 Hiro Ayettey. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var tableViewRows = 5
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewRows
    }
     @IBOutlet weak var timeSliderObject: UISlider!
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Addition: " + String(gameManager.scores[4])
            break
        case 1:
            cell.textLabel?.text = "Subtraction: " + String(gameManager.scores[3])
            break
        case 2:
            cell.textLabel?.text = "Multiplication: " + String(gameManager.scores[2])
            break
        case 3:
            cell.textLabel?.text = "Division: " + String(gameManager.scores[1])
            break
        case 4:
            cell.textLabel?.text = "Random: " + String(gameManager.scores[0])
            break
        default:
            cell.textLabel?.text = "0"
        }
        cell.backgroundColor = #colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1)
      //  cell.textLabel.font = [UIFont fontWithName: @"Arial" size: 18.0]
        return cell
    }
    
    @IBOutlet weak var timeDisplayLabel: UILabel!
    @IBAction func timeSlider(_ sender: UISlider) {
        gameManager.seconds = Int(sender.value)
        timeDisplayLabel.text = String(gameManager.seconds)
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeSliderObject.value = Float(gameManager.seconds)
        timeDisplayLabel.text = String(gameManager.seconds)
        
        // Do any additional setup after loading the view.
    }
    
}
