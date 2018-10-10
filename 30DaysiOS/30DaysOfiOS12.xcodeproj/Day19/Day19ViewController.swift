//
//  Day19ViewController.swift
//  30DaysOfiOS12
//
//  Created by DevTechie Interactive on 9/28/18.
//  Copyright © 2018 Devtechie. All rights reserved.
//

import UIKit
import LocalAuthentication

class Day19ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Biometrics Authentication"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.authUserWithBiometrics()
    }
    
    func authUserWithBiometrics() {
        let context: LAContext = LAContext()
        let localizedReasonMessage = "Authentication Needed for the App!"
        var authError: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &authError) {
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: localizedReasonMessage) { (success, evaluationError) in
                
                if success {
                    DispatchQueue.main.async {
                        print("Auth cleared")
                        self.view.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
                    }
                }
                else {
                    DispatchQueue.main.async {
                        self.view.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.3803921569, blue: 0.3882352941, alpha: 1)
                    }
                    if let error = evaluationError as? NSError {
                        print(self.laErrorMessage(errorCode: error.code))
                    }
                }
            }
            
        }
    }
    
    func laErrorMessage(errorCode: Int) -> String {
        var message = ""
        switch errorCode {
        
        case LAError.appCancel.rawValue:
            message = "Auth was cancelled by application"
        case LAError.authenticationFailed.rawValue:
            message = "User failed to provide valid credentials"
        case LAError.invalidContext.rawValue:
            message = "Context is invalid"
        case LAError.passcodeNotSet.rawValue:
            message = "Passcode is not set on the device"
        case LAError.systemCancel.rawValue:
            message = "Auth was cancelled due to system event"
        case LAError.touchIDLockout.rawValue:
            message = "Too many failed attampts"
        case LAError.touchIDNotEnrolled.rawValue:
            message = "TouchId not available on device"
        case LAError.userCancel.rawValue:
            message = "User cancelled"
        case LAError.userFallback.rawValue:
            message = "User seleced fallback"
        default:
            message = "No a valid choice"
            
        }
        return message
    }
}















