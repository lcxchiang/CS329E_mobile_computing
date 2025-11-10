//
//  ViewController.swift
//  CD-Multithreading
//
//  Created by bulko on 10/22/25.
//

import UIKit

class ViewController: UIViewController {
    
    private var queue: DispatchQueue!
    
    var dot: UIView!
    var xLeft: Double!
    var xRight: Double!
    var y: Double!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // size of dot:  initially, a square 100 x 100
        let dotHeight = 100.0
        let dotWidth = 100.0
        
        xLeft = dotWidth/2.0
        xRight = view.bounds.width - 1.5 * dotWidth
        
        y = (view.bounds.height / 2.0) - (dotHeight / 2.0)
        
        dot = UIView(frame: CGRect(
            x: xLeft,
            y: y,
            width: dotWidth,
            height: dotHeight))
        dot.backgroundColor = .red
        
        // make it round
        dot.layer.cornerRadius = dotWidth/2.0
        
        view.addSubview(dot)
        
        queue = DispatchQueue(label: "myQueue", qos: .utility)

        queue.async {
            self.moveBlock()
        }
    }

    func moveBlock() {
        
        var toggle = "left"
        
        while true {
            usleep(300000)   // microseconds
            
            if toggle == "left" {
                toggle = "right"
                DispatchQueue.main.async {
                    self.dot.frame.origin.x = self.xRight
                }
            } else {
                toggle = "left"
                DispatchQueue.main.async {
                    self.dot.frame.origin.x = self.xLeft
                }
            }

        }

    }
    

}

