//
//  Day3ViewController.swift
//  30DaysOfiOS12
//
//  Created by DevTechie Interactive on 9/19/18.
//  Copyright © 2018 Devtechie. All rights reserved.
//

import UIKit

class Day3ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.label.alpha = 0.5
        self.title = "Alpha Slider"
    }
    
    @IBAction func didChangeSliderValue(_ sender: UISlider) {
        self.label.alpha =  CGFloat(sender.value)
    }

}
