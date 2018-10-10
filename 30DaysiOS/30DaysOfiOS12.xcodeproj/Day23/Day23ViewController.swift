//
// Day23ViewController
// 30DaysOfiOS12
//
// Created by DevTechie Interactive on 10/3/18.
// Copyright © 2018 Devtechie. All rights reserved.
//

import UIKit

class Day23ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "CIFilter & GCD"
    }
    
    @IBAction func didTapProcessImage(_ sender: UIButton) {
        
        let image = CIImage(cgImage: imageView.image!.cgImage!)
        self.applyFilter(image: image)
    }

    func applyFilter(image: CIImage) {
        DispatchQueue.global().async {
            //sleep(5)
            let filter = CIFilter(name: "CISepiaTone")!
            filter.setDefaults()
            filter.setValue(image, forKey: kCIInputImageKey)
            //filter.setValue(0.5, forKey: kCIInputIntensityKey)
            
            let context = CIContext(options: nil)
            let imageReference = context.createCGImage(filter.outputImage!, from: image.extent)
            DispatchQueue.main.async {
                self.imageView.image = UIImage(cgImage: imageReference!)
            }
        }
    }
    
}
