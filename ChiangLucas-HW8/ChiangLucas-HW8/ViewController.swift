//
//  ViewController.swift
//  ChiangLucas-HW8
//
//  Created by Lucas Chiang on 11/10/25.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    var clickCounter: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        button.setImage(UIImage(named: "uttower"), for: .normal)
        
        // Ask for Notification Authorization
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, error in
            if granted {
                print("All set!")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }

    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        
        // Increment the click counter by 1
        self.clickCounter += 1
        print(self.clickCounter)
        
        if clickCounter % 4 == 0 {
            print("Scheduling Notification!")
            // create content
            let content = UNMutableNotificationContent()
            content.title = "Click Count"
            content.subtitle = "Hello"
            content.body = "You clicked button \(clickCounter) times"
            // create trigger
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 8, repeats: false)
            // create request
            let request = UNNotificationRequest(identifier: "myNotification", content: content, trigger: trigger)
            // add request
            UNUserNotificationCenter.current().add(request)
        }

        if button.image(for: .normal) == UIImage(named: "uttower") {
            // starting alpha value
            UIView.animate (
                withDuration: 1.0,
                delay: 0.0,
                options: .curveEaseOut,
                animations: {
                    self.button.imageView?.alpha = 0.0
                },
                completion: { finished in
                    // Set the new image
                    self.button.setImage(UIImage(named: "ut"), for: .normal)
                    // Animation for the new image
                    UIView.animate (
                        withDuration: 1.0,
                        delay: 0.0,
                        options: .curveEaseIn,
                        animations: {
                            self.button.imageView?.alpha = 1.0
                        }
                    )
                }
            )
        } else {
            // starting alpha value
            UIView.animate (
                withDuration: 1.0,
                delay: 0.0,
                options: .curveEaseOut,
                animations: {
                    self.button.imageView?.alpha = 0.0
                },
                completion: { finished in
                    // Set the new image
                    self.button.setImage(UIImage(named: "uttower"), for: .normal)
                    // Animation for the new image
                    UIView.animate (
                        withDuration: 1.0,
                        delay: 0.0,
                        options: .curveEaseIn,
                        animations: {
                            self.button.imageView?.alpha = 1.0
                        }
                    )
                }
            )
        }
        
    }

}

