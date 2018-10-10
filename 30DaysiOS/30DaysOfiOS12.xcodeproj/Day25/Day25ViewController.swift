//
// Day25ViewController
// 30DaysOfiOS12
//
// Created by DevTechie Interactive on 10/4/18.
// Copyright © 2018 Devtechie. All rights reserved.
//

import UIKit
import CoreLocation

class Day25ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var locationLabel: UILabel!
    
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Core Location"
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.locationLabel.text = "Error getting location \(error.localizedDescription)"
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        CLGeocoder().reverseGeocodeLocation(manager.location!) { (placemarks, error) in
            
            guard error == nil else {
                self.locationLabel.text = "Error getting location \(error!.localizedDescription)"
                return
            }
            
            if placemarks!.count > 0 {
                let placeMark = placemarks![0]
                self.locationManager.stopUpdatingLocation()
                
                let locality = placeMark.locality ?? ""
                let postalCode = placeMark.postalCode ?? ""
                let adminArea = placeMark.administrativeArea ?? ""
                let country = placeMark.country ?? ""
                
                self.locationLabel.text = "\(locality) \(postalCode) \(adminArea) \(country)"
            } else {
                self.locationLabel.text = "There is no placemark data."
            }
            
        }
    }

}
