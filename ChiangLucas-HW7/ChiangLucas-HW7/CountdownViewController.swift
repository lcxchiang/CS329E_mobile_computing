//
//  CountdownViewController.swift
//  ChiangLucas-HW7
//
//  Created by Lucas Chiang on 11/3/25.
//

// Project: ChiangLucas-HW7
// EID: lmc4866
// Course: CS329E

import UIKit
import Foundation

class CountdownViewController: UIViewController {

    private var queue: DispatchQueue!

    @IBOutlet weak var eventLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!

    var timer: Timer?
    var start = false

    override func viewDidLoad() {
        super.viewDidLoad()
        start = true

        if let timer = timer {
            self.eventLabel.text = timer.event
            self.locationLabel.text = timer.location
            self.timeLabel.text = "\(timer.timeRemaining)"
        }

        queue = DispatchQueue(label: "myQueue", qos: .utility)

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        start = true
        queue.async {
            self.decreaseTimer()
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        start = false
    }

    func decreaseTimer() {
        while let timer = timer, timer.timeRemaining > 0, start {
            usleep(1000000)
            if !start {
                break
            }
            timer.timeRemaining -= 1
            DispatchQueue.main.async {
                self.timeLabel.text = "\(self.timer!.timeRemaining)"
            }
        }

    }

}
