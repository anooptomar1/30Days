//
//  Day4ViewController.swift
//  30DaysOfiOS12
//
//  Created by DevTechie Interactive on 9/20/18.
//  Copyright © 2018 Devtechie. All rights reserved.
//

import UIKit

class Day4ViewController: UIViewController {
    
    @IBOutlet weak var mainAmountField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    var numberFormatter = NumberFormatter()
    var tipModel = TipModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        numberFormatter.currencySymbol = "$"
        numberFormatter.allowsFloats = true
        
        self.title = "Tip Calculator"
        
        // tap gesture
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapOnScreen(_:)))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func didTapOnScreen(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func didChangeSegment(_ sender: UISegmentedControl) {
        if let number = numberFormatter.number(from: mainAmountField.text!) {
            tipModel.mainAmount = number.doubleValue
            tipModel.tipPercentage = segmentToTipPercent(index: sender.selectedSegmentIndex)
            setTipsToUI(tipTouple: tipModel.calculateTipAmount())
        }
    }
    
    @IBAction func didChangeSliderValue(_ sender: UISlider) {
        if let number = numberFormatter.number(from: mainAmountField.text!) {
            tipModel.mainAmount = number.doubleValue
            tipModel.tipPercentage = Double(sender.value)
            setTipsToUI(tipTouple: tipModel.calculateTipAmount())
        }
    }
    
    @IBAction func didEnterAmount(_ sender: UITextField) {
        if let number = numberFormatter.number(from: mainAmountField.text!) {
            tipModel.mainAmount = number.doubleValue
            tipModel.tipPercentage = segmentToTipPercent(index: segmentControl.selectedSegmentIndex)
            setTipsToUI(tipTouple: tipModel.calculateTipAmount())
        }
    }
    
    func setTipsToUI(tipTouple:(tipAmount: Double, totalAmount: Double)) {
        self.tipAmountLabel.text = String.init(format: "$%0.2f", tipTouple.tipAmount)
        self.totalAmountLabel.text = String.init(format: "$%0.2f", tipTouple.totalAmount)
    }
    
    func segmentToTipPercent(index: Int) -> Double {
        switch index {
        case 0:
            return 0.10
        case 1:
            return 0.15
        case 2:
            return 0.18
        case 3:
            return 0.20
        default:
            return 0.18
        }
    }

}

class TipModel {
    var mainAmount: Double?
    var tipPercentage: Double?
    
    func calculateTipAmount() -> (tipAmount: Double, totalAmount: Double) {
        guard let mainAmount = mainAmount, let tipPercent = tipPercentage else {
            return(0.0,0.0)
        }
        return (mainAmount * tipPercent, (mainAmount * tipPercent) + mainAmount)
    }
}
