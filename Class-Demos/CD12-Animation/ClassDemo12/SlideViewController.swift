//
//  SlideViewController.swift
//  ClassDemo12
//
//  Created by bulko on 03/18/18.
//  Copyright © 2018 bulko. All rights reserved.
//

import UIKit

class SlideViewController: UIViewController {

    @IBOutlet weak var labelMayTheForce: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onButtonSlideInFromRight(_ sender: Any) {
        
        // Starting center value
        self.labelMayTheForce.center.x = self.view.center.x + self.view.bounds.width
        
        UIView.animate(
            withDuration: 3.0,
            animations: {
                self.labelMayTheForce.center.x -= self.view.bounds.width
            } 
        )
    }
    
    @IBAction func onButtonSlideInFromLeft(_ sender: Any) {
        
        // Starting center value
        self.labelMayTheForce.center.x = self.view.center.x - self.view.bounds.width
        
        UIView.animate(
            withDuration: 3.0,
            animations: {
                self.labelMayTheForce.center.x += self.view.bounds.width
            }
        )
        
    }
    
    @IBAction func onButtonSlideOutToRight(_ sender: Any) {
        
        // Starting center value
        self.labelMayTheForce.center.x = self.view.center.x
        
        UIView.animate(
            withDuration: 3.0,
            animations: {
                self.labelMayTheForce.center.x += self.view.bounds.width
            }
        )
    }
    
    @IBAction func onButtonSlideOutToLeft(_ sender: Any) {
        
        // Starting center value
        self.labelMayTheForce.center.x = self.view.center.x
        
        UIView.animate(
            withDuration: 3.0,
            animations: {
                self.labelMayTheForce.center.x -= self.view.bounds.width
            }
        )
    }

}
