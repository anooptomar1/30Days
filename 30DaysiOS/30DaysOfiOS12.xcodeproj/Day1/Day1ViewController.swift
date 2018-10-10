//
//  Day1ViewController.swift
//  30DaysOfiOS12
//
//  Created by DevTechie Interactive on 9/19/18.
//  Copyright © 2018 Devtechie. All rights reserved.
//

import UIKit

class Day1ViewController: UIViewController {
    
    @IBOutlet weak var countLabel: UILabel!

    let formatter = NumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tap Counter"
        formatter.allowsFloats = false
        
    }
    
    @IBAction func didTapButton(_ sender: UIButton) {
        print(Int(countLabel.text!)!)
        if let numberFromLabel = formatter.number(from: countLabel.text!) {
            countLabel.text = "\(numberFromLabel.intValue + 1)"
        }
    }
    
    @IBAction func didTapReset(_ sender: UIButton) {
        countLabel.text = "\(0)"
    }
    
}
