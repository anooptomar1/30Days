//
//  Day14ViewController.swift
//  30DaysOfiOS12
//
//  Created by DevTechie Interactive on 9/26/18.
//  Copyright © 2018 Devtechie. All rights reserved.
//

import UIKit

class Day14ViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Keyboard Accessories"
        
        // left nav bar item
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel, target: self, action: #selector(dismissVC))
        
        // right nav bar item
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: nil, action: nil)
        
        // keyboard toolbar
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        keyboardToolbar.setBackgroundImage(UIImage(), forToolbarPosition: UIBarPosition.any, barMetrics: UIBarMetrics.default)
        keyboardToolbar.setShadowImage(UIImage(), forToolbarPosition: UIBarPosition.any)
        
        // camera button
        let cameraButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.camera, target: nil, action: nil)
        cameraButton.tintColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
        
        // fixed space
        let fixedSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.fixedSpace, target: nil, action: nil)
        fixedSpace.width = 20
        
        // trash button
        let trashButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.trash, target: nil, action: nil)
        trashButton.tintColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
        
        // flexible space
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        // bookmark button
        let bookmarkButton = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: nil, action: nil)
        bookmarkButton.tintColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
        
        keyboardToolbar.items = [cameraButton, fixedSpace, trashButton, flexSpace, bookmarkButton]
        
        textView.inputAccessoryView = keyboardToolbar
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.textView.becomeFirstResponder()
    }

    @objc func dismissVC() {
        self.navigationController?.popViewController(animated: true)
    }
}
