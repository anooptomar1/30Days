//
//  Day12AddViewController.swift
//  30DaysOfiOS12
//
//  Created by DevTechie Interactive on 9/26/18.
//  Copyright © 2018 Devtechie. All rights reserved.
//

import UIKit

@objc protocol Day12AddViewControllerDelegate: class {
    func didAddNewItem(controller: Day12AddViewController, item: String)
    @objc optional func thisDeosntDoAnything()
}

class Day12AddViewController: UIViewController {

    static let identifier = "addNew"
    
    weak var delegate: Day12AddViewControllerDelegate?
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // done button
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(didTapDoneButton(_:)))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.textView.becomeFirstResponder()
    }
    
    @objc func didTapDoneButton(_ sender: UIBarButtonItem) {
        if let text = textView.text {
            self.delegate?.didAddNewItem(controller: self, item: text)
            self.navigationController?.popViewController(animated: true)
        }
    }

}
