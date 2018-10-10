//
//  Day20ViewController.swift
//  30DaysOfiOS12
//
//  Created by DevTechie Interactive on 9/28/18.
//  Copyright © 2018 Devtechie. All rights reserved.
//

import UIKit

class Day20ViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    
    private let backImageView: UIImageView = UIImageView(image: #imageLiteral(resourceName: "image2"))
    private let frontImageView: UIImageView = UIImageView(image: #imageLiteral(resourceName: "image25"))
    
    private var showingBack = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Card Flip Animation"
        
        frontImageView.contentMode = .scaleAspectFill
        backImageView.contentMode = .scaleAspectFill
        
        frontImageView.clipsToBounds = true
        backImageView.clipsToBounds = true
        
        containerView.addSubview(frontImageView)
        containerView.addSubview(backImageView)
        
        frontImageView.translatesAutoresizingMaskIntoConstraints = false
        backImageView.translatesAutoresizingMaskIntoConstraints = false
        
        backImageView.isHidden = true
        
        NSLayoutConstraint.activate([
            
            frontImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            frontImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            frontImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            frontImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            backImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            backImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            backImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            backImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
            ])
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(flipCard))
        containerView.addGestureRecognizer(tapGesture)
        
        containerView.backgroundColor = .clear
        containerView.layer.shadowOffset = .zero
        containerView.layer.shadowColor = UIColor.yellow.cgColor
        containerView.layer.shadowRadius = 5
        containerView.layer.shadowOpacity = 1
        containerView.layer.shadowPath = UIBezierPath(rect: containerView.bounds).cgPath
        
        self.view.backgroundColor = .black
    }
    
    @objc func flipCard() {
        let transitionSide = showingBack ? UIView.AnimationOptions.transitionFlipFromLeft:
        UIView.AnimationOptions.transitionFlipFromRight
        
        showingBack = !showingBack
        let transitionOptions: UIView.AnimationOptions = [transitionSide, .showHideTransitionViews]
        
        UIView.transition(with: containerView, duration: 1.0, options: transitionOptions, animations: {
            self.frontImageView.isHidden = self.showingBack
        }, completion: nil)
        
        UIView.transition(with: containerView, duration: 1.0, options: transitionOptions, animations: {
            self.backImageView.isHidden = !self.showingBack
        }, completion: nil)
    }
}
