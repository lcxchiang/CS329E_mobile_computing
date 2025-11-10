//
//  SpinViewController.swift
//  ClassDemo12
//
//  Created by bulko on 03/18/18.
//  Copyright © 2018 bulko. All rights reserved.
//

import UIKit

class SpinViewController: UIViewController {

    @IBOutlet weak var labelProsper: UILabel!
    @IBOutlet weak var textfieldDuration: UITextField!
    @IBOutlet weak var labelDuration: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onButtonStartSpin(_ sender: Any) {
        
        // Starting transform value
   //     self.labelProsper.transform = CGAffineTransformIdentity
        
        var durationValue = 3.0  // Default duration
        if let duration = textfieldDuration.text {
            if let durationFloat = Double(duration) {
                durationValue = durationFloat
            }
        }
        
        UIView.animate(
            withDuration: durationValue,
            animations: {
                // 180 degree rotation
                self.labelProsper.transform =
                    self.labelProsper.transform.rotated(by: CGFloat(Double.pi))
                }
        )
        
    }

}
