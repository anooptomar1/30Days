//
//  Day6ViewController.swift
//  30DaysOfiOS12
//
//  Created by DevTechie Interactive on 9/20/18.
//  Copyright © 2018 Devtechie. All rights reserved.
//

import UIKit

class Day6ViewController: UIViewController {
    
    @IBOutlet weak var dateTimeLabel: UILabel!

    var dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Date Formatter"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = "E, MMMM dd yyyy HH:mm:ss"
        
        dateTimeLabel.text = dateFormatter.string(from: Date())
    }

    @IBAction func didTapRefresh(_ sender: UIButton) {
        dateTimeLabel.text = dateFormatter.string(from: Date())
    }

}
