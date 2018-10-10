//
//  Day2ViewController.swift
//  30DaysOfiOS12
//
//  Created by DevTechie Interactive on 9/19/18.
//  Copyright © 2018 Devtechie. All rights reserved.
//

import UIKit

class Day2ViewController: UIViewController {
    
    @IBOutlet weak var counterLabel: UILabel!
    
    let numberFormatter = NumberFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        numberFormatter.allowsFloats = false
        self.title = "Gesture Tap Counter"
    }
    
    @IBAction func didTapOnScreen(_ sender: UITapGestureRecognizer) {
        self.incrementCounter()
    }
    
    @IBAction func didLongPressScreen(_ sender: UILongPressGestureRecognizer) {
        
        self.incrementCounter()
    }
    
    func incrementCounter() {
        if let number = numberFormatter.number(from: counterLabel.text!) {
            counterLabel.text = "\(number.intValue + 1)"
        }
    }
    
}
