//
//  TimerViewController.swift
//  ChiangLucas-HW7
//
//  Created by Lucas Chiang on 11/3/25.
//

// Project: ChiangLucas-HW7
// EID: lmc4866
// Course: CS329E

import UIKit

class TimerViewController: UIViewController {

    @IBOutlet weak var eventField: UITextField!
    @IBOutlet weak var locationField: UITextField!
    @IBOutlet weak var timeField: UITextField!

    var delegate: UIViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        timeField.keyboardType = .numberPad
        eventField.text = ""
        locationField.text = ""
        timeField.text = ""
    }

    @IBAction func savePressed(_ sender: Any) {
        let newTimer = Timer(eve: eventField.text ?? "", loc: locationField.text ?? "", time: Int(timeField.text ?? "") ?? 0)
        let otherVC = delegate as! AddTimer
        otherVC.addTimer(Timer: newTimer)
        
        // reset fields
        eventField.text = ""
        locationField.text = ""
        timeField.text = ""
    }

}
