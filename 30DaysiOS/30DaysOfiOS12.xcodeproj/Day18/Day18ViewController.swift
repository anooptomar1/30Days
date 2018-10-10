//
//  Day18ViewController.swift
//  30DaysOfiOS12
//
//  Created by DevTechie Interactive on 9/28/18.
//  Copyright © 2018 Devtechie. All rights reserved.
//

import UIKit
import WebKit

class Day18ViewController: UIViewController {
    
    @IBOutlet weak var addressbar: UITextField!
    @IBOutlet weak var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        self.title = "Web Browser"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addressbar.becomeFirstResponder()
    }
    
    @IBAction func didTapGo(_ sender: UIButton) {
        self.view.endEditing(true)
        guard let url = URL(string: addressbar.text!) else {
            return
        }
        webView.load(URLRequest(url: url))
    }
}

extension Day18ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        addressbar.text = webView.url?.absoluteString
    }
}
