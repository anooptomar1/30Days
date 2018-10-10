//
// Day30ViewController
// 30DaysOfiOS12
//
// Created by DevTechie Interactive on 10/9/18.
// Copyright © 2018 Devtechie. All rights reserved.
//

import UIKit
import ImageIO
import CoreML
import Vision

class Day30ViewController: UIViewController {
    
    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var classificationLabel: UILabel!
    
    lazy var classRequest: VNCoreMLRequest = {
        do{
            let model = try VNCoreMLModel(for: MobileNet().model)
            let request = VNCoreMLRequest(model: model, completionHandler: { (request, error) in
                self.classification(for: request, error: error)
            })
            request.imageCropAndScaleOption = .centerCrop
            return request
        }
        catch {
            fatalError("\(error)")
        }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "CoreML + Vision"
        cameraButton.addTarget(self, action: #selector(selectPhoto(_:)), for: UIControl.Event.touchUpInside)
    }
    
    @objc func selectPhoto(_ sender: UIButton) {
        let imgPicker = UIImagePickerController()
        imgPicker.delegate = self
        imgPicker.sourceType = .photoLibrary
        present(imgPicker, animated: true)
    }
    
    func classification(for request: VNRequest, error: Error?) {
        DispatchQueue.main.async {
            guard let classResults = request.results, let classifications = classResults as? [VNClassificationObservation], classifications.count != 0 else {
                self.classificationLabel.text = "Unable to classify."
                return
            }
            
           let topResults = classifications.prefix(2)
            let desc = topResults.map({ classificationObservation in
                return String(format: " (%.2f) %@", classificationObservation.confidence, classificationObservation.identifier)
            })
            self.classificationLabel.text = desc.joined(separator: "\n")
        }
    }
    
    func processImage(image: UIImage) {
        classificationLabel.text = "Working..."
        let orientation = CGImagePropertyOrientation(image.imageOrientation)
        guard let ciImage = CIImage(image: image) else {
            fatalError("Unable to process")
        }
        
        DispatchQueue.global(qos: DispatchQoS.QoSClass.userInitiated).async {
            let handler = VNImageRequestHandler(ciImage: ciImage, orientation: orientation)
            do {
                try handler.perform([self.classRequest])
            }
            catch {
                fatalError("Failed to do classification")
            }
        }
    }
}

extension Day30ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        imageV.image = image
        processImage(image: image)
    }
}

extension CGImagePropertyOrientation {
    init(_ orientation: UIImage.Orientation) {
        switch orientation {
        case .up:
            self = .up
        case .upMirrored:
            self = .upMirrored
        case .down:
            self = .down
        case .downMirrored:
            self = .downMirrored
        case .left:
            self = .left
        case .leftMirrored:
            self = .leftMirrored
        case .right:
            self = .right
        case .rightMirrored:
            self = .rightMirrored
        }
    }
}
