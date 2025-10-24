//
//  SecondViewController.swift
//  CD-Segue
//
//  Created by bulko on 9/17/25.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var nameField2: UILabel!
    @IBOutlet weak var textField2: UITextField!
    
    var delegate: UIViewController!
    var vc2NewName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameField2.text = vc2NewName
    }
    
    @IBAction func button2Pressed(_ sender: Any) {
        let otherVC = delegate as! TextChanger
        otherVC.changeText(newName: textField2.text!)
        self.dismiss(animated: true)
    }
    

}
