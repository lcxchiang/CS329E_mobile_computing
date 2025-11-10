//
//  FadeViewController.swift
//  ClassDemo12
//
//  Created by bulko on 03/18/18.
//  Copyright © 2018 bulko. All rights reserved.
//

import UIKit

class FadeViewController: UIViewController {

    @IBOutlet weak var labelBazinga: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onButtonFadeIn(_ sender: Any) {
        // Starting alpha value
        self.labelBazinga.alpha = 0.0
        
        UIView.animate (
            withDuration: 1.0,
            animations: {
                self.labelBazinga.alpha = 1.0
        }
        )
    }
    
    @IBAction func onButtonFadeOut(_ sender: Any) {
        self.labelBazinga.alpha = 1.0
        
        UIView.animate(
            withDuration: 1.0,
            animations: {
            self.labelBazinga.alpha = 0.0
            }
        )
    }

}
