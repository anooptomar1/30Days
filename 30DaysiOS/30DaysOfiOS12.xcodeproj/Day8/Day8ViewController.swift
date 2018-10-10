//
//  Day8ViewController.swift
//  30DaysOfiOS12
//
//  Created by DevTechie Interactive on 9/20/18.
//  Copyright © 2018 Devtechie. All rights reserved.
//

import UIKit

class Day8ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Keyboard Appearance"
        
        textView.keyboardType = .twitter
        textView.keyboardAppearance = .dark
        
        // swipe gesture
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeDown(_:)))
        swipeGesture.direction = .down
        self.textView.addGestureRecognizer(swipeGesture)
    }
    
    @objc func didSwipeDown(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .down {
            self.view.endEditing(true)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if self.textView.canBecomeFirstResponder {
            self.textView.becomeFirstResponder()
        }
    }
    

}
