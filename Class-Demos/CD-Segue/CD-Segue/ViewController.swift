//
//  ViewController.swift
//  CD-Segue
//
//  Created by bulko on 9/15/25.
//

import UIKit

protocol TextChanger {
    func changeText(newName:String)
}

class ViewController: UIViewController, TextChanger {

    @IBOutlet weak var nameLabel1: UILabel!
    @IBOutlet weak var textField1: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel1.text = "undefined"
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SegueIdentifier",
           let nextVC = segue.destination as? SecondViewController {
            nextVC.delegate = self
            nextVC.vc2NewName = textField1.text!
        }
    }
    
    func changeText(newName: String) {
        nameLabel1.text = newName
    }
    

}

