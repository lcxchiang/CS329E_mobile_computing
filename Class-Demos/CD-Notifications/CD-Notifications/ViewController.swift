//
//  ViewController.swift
//  CD-Notifications
//
//  Created by bulko on 10/31/25.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var picker: UIPickerView!
    
    var pickerData = ["1", "2", "3", "4", "5", "10", "20", "30"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.dataSource = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }

    @IBAction func requestBtnPushed(_ sender: Any) {
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted {        // granted is a Boolean
                print("All set!")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
        
    }
    
    @IBAction func scheduleBtnPushed(_ sender: Any) {
        
        // get selected value from the picker
        let pickerRow = picker.selectedRow(inComponent: 0)
        let pickerValue = Double(pickerData[pickerRow])!

        // create content
        let content = UNMutableNotificationContent()
        content.title = "Here's your notification"
        content.subtitle = "After " + String(pickerValue) + " seconds"
        content.sound = UNNotificationSound.default
        
        // create trigger
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: pickerValue, repeats: false)
        
        // combine it all into a request
        let request = UNNotificationRequest(identifier: "myNotification",
                                            content: content,
                                            trigger: trigger)
        
        // add our notification request
        UNUserNotificationCenter.current().add(request)
        
    }

}

