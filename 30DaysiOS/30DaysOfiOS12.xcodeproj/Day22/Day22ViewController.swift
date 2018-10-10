//
// Day22ViewController
// 30DaysOfiOS12
//
// Created by DevTechie Interactive on 10/2/18.
// Copyright © 2018 Devtechie. All rights reserved.
//

import UIKit
import UserNotifications

class Day22ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Notifications"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        center.requestAuthorization(options: [UNAuthorizationOptions.alert, .sound, .badge]) { (success, error) in
            
        }
    }
    
    @IBAction func didTapNotification(_ sender: UIButton) {
        let center = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        content.title = "New Course Announcement"
        content.subtitle = "30 Days of iOS 12"
        content.body = "Learn iOS 12 in 30 Days"
        content.sound = UNNotificationSound.default
        // image banner
        if let imageBanner = try? UNNotificationAttachment(identifier: "imageBanner", url: Bundle.main.url(forResource: "ios12", withExtension: "jpg")!, options: [:]) {
            content.attachments = [imageBanner]
        }
        
        // add button
        let dismiss = UNNotificationAction(identifier: "dismiss", title: "Dismiss", options: [])
        let notificationCategory = UNNotificationCategory(identifier: "notificationCategory", actions: [dismiss], intentIdentifiers: [], hiddenPreviewsBodyPlaceholder: "", options: [])
        content.categoryIdentifier = "notificationCategory"
        center.setNotificationCategories([notificationCategory])
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2.0, repeats: false)
        let request = UNNotificationRequest(identifier: "ContentIdentifier", content: content, trigger: trigger)
        
        center.add(request) { (error) in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }

}

extension Day22ViewController: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([UNNotificationPresentationOptions.alert, .badge, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print(response.actionIdentifier.description)
        completionHandler()
    }
}
