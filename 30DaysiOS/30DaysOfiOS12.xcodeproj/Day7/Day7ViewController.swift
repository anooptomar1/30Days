//
//  Day7ViewController.swift
//  30DaysOfiOS12
//
//  Created by DevTechie Interactive on 9/20/18.
//  Copyright © 2018 Devtechie. All rights reserved.
//

import UIKit

class Day7ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "First View"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(didPressDoneButton(_:)))
    }
    
    @objc func didPressDoneButton(_ sender: UIBarButtonItem) {
         performSegue(withIdentifier: Day7DetailViewController.identifier, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Day7DetailViewController.identifier {
            let vc = segue.destination as! Day7DetailViewController
            vc.text = self.textView.text!
        }
    }

}

class Day7DetailViewController: UIViewController {
    
    static let identifier = "day7Details"
    
    var text: String?
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        self.title = "Second View"
        textView.text = text
        super.viewDidLoad()
        
    }
    
    
}
