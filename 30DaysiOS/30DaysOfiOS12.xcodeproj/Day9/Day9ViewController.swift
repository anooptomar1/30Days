//
//  Day9ViewController.swift
//  30DaysOfiOS12
//
//  Created by DevTechie Interactive on 9/20/18.
//  Copyright © 2018 Devtechie. All rights reserved.
//

import UIKit

class Day9ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    lazy var imagePicker: UIImagePickerController = {
        let ip = UIImagePickerController()
        ip.delegate = self
        ip.allowsEditing = false
        ip.sourceType = .photoLibrary
        return ip
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Display Photo"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.camera, target: self, action: #selector(didTapCameraButton(_:)))
    }
    
    @objc func didTapCameraButton(_ sender: UIBarButtonItem) {
        present(imagePicker, animated: true, completion: nil)
    }
}

extension Day9ViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return
        }
        
        self.imageView.image = pickedImage
        dismissVC()
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismissVC()
    }
    
    func dismissVC() {
        dismiss(animated: true, completion: nil)
    }
}
