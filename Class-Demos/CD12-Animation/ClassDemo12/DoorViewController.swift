//
//  DoorViewController.swift
//  ClassDemo12
//
//  Created by bulko on 03/18/18.
//  Copyright © 2018 bulko. All rights reserved.
//

import UIKit

class DoorViewController: UIViewController {
    
    @IBOutlet weak var leftDoor: UIImageView!
    @IBOutlet weak var rightDoor: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        UIView.animate(
            withDuration: 0.7,
            delay: 1.0,
            options: .curveEaseOut,
            animations: {
                self.leftDoor.frame.origin.x -= self.leftDoor.frame.size.width
                self.rightDoor.frame.origin.x += self.rightDoor.frame.size.width
            },
            completion: { finished in
                print("Doors opened!")
        })
    }
    
    @IBAction func onCloseButtonPressed(_ sender: Any) {
        
        UIView.animate(
            withDuration: 0.7,
            delay: 1.0,
            options: .curveEaseOut,
            animations: {
                self.leftDoor.frame.origin.x += self.leftDoor.frame.size.width
                self.rightDoor.frame.origin.x -= self.rightDoor.frame.size.width
            },
            completion: { finished in
                print("Doors closed!")
        })
    }

}
