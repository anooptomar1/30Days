//
// Day24ViewController
// 30DaysOfiOS12
//
// Created by DevTechie Interactive on 10/3/18.
// Copyright © 2018 Devtechie. All rights reserved.
//

import UIKit

class Day24ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Extension + Networking"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // load image here
        UIImage.imageAsync(urlString: "https://image.tmdb.org/t/p/w500//dXpwPlJF0yKGdVIVwJXCY59ak8Q.jpg") { (image) in
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
    }


}
