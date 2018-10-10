//
// Day27ViewController
// 30DaysOfiOS12
//
// Created by DevTechie Interactive on 10/5/18.
// Copyright © 2018 Devtechie. All rights reserved.
//

import UIKit

class Day27ViewController: UIViewController {

    @IBOutlet weak var inputTextView: UITextView!
    @IBOutlet weak var outputTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Cool Data Detector"
    }
    
    @IBAction func didTapParseButton(_ sender: UIButton) {
        let inputString = inputTextView.text
        let typesToDetect: NSTextCheckingResult.CheckingType = [NSTextCheckingResult.CheckingType.address, .phoneNumber]
        let dataDetector = try? NSDataDetector(types: typesToDetect.rawValue)
        let range = NSMakeRange(0, inputString!.utf8.count)
        let matchesFound = dataDetector?.matches(in: inputString!, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: range)
        var detectedPhoneNumber = ""
        var detectedAddressComponents = [NSTextCheckingKey: String]()
        if let matches = matchesFound {
            for match in matches {
                if match.resultType == .address {
                    detectedAddressComponents[NSTextCheckingKey.street] = match.addressComponents![NSTextCheckingKey.street]
                    detectedAddressComponents[NSTextCheckingKey.city] = match.addressComponents![NSTextCheckingKey.city]
                    detectedAddressComponents[NSTextCheckingKey.state] = match.addressComponents![NSTextCheckingKey.state]
                    detectedAddressComponents[NSTextCheckingKey.zip] = match.addressComponents![NSTextCheckingKey.zip]
                } else if match.resultType == .phoneNumber {
                    detectedPhoneNumber = match.phoneNumber ?? ""
                }
            }
        }
        outputTextView.text = "Street: \(detectedAddressComponents[NSTextCheckingKey.street] ?? "") \n City: \(detectedAddressComponents[NSTextCheckingKey.city] ?? "") \n State: \(detectedAddressComponents[NSTextCheckingKey.state] ?? "") \n Zip: \(detectedAddressComponents[NSTextCheckingKey.zip] ?? "") \n\n Phone Number: \(detectedPhoneNumber)"
    }
}
