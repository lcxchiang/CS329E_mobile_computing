//
//  ViewController.swift
//  ClassDemo2
//
//  Created by bulko on 6/19/19.
//  Copyright © 2019 bulko. All rights reserved.
//

import UIKit

protocol TextChanger {
    func changeText(newName:String)
    func blankTextField()
}

class ViewController: UIViewController, TextChanger {

    var nextVC: SecondViewController!
    var titleLabel1: UILabel!
    var nameLabel1: UILabel!
    var textField1: UITextField!
    var button1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel1 = UILabel(frame: CGRect(x:20, y:100, width:100, height:30))
        titleLabel1.textAlignment = NSTextAlignment.center
        titleLabel1.text = "VC1"
        titleLabel1.center = CGPoint(x: view.bounds.midX, y:100)
        self.view.addSubview(titleLabel1)

        nameLabel1 = UILabel(frame: CGRect(x:20, y:150, width:view.bounds.width, height:30))
        nameLabel1.textAlignment = NSTextAlignment.left
        nameLabel1.text = "unknown"
        self.view.addSubview(nameLabel1)
        
        textField1 = UITextField(frame: CGRect(x:20, y:200, width:view.bounds.width-50, height:30))
        textField1.borderStyle = UITextField.BorderStyle.line
        textField1.text = ""
        self.view.addSubview(textField1)
        
        button1 = UIButton(type: .roundedRect)
        button1.frame = CGRect(x:20, y:300, width:50, height:30)
        button1.setTitle("Enter", for: .normal)
        button1.center = CGPoint(x: view.bounds.midX, y: 300)
        button1.addTarget(self, action: #selector(button1Pressed), for: .touchUpInside)
        self.view.addSubview(button1)
    }

    @objc func button1Pressed(sender: UIButton!) {
        if nextVC == nil {
            nextVC = SecondViewController()
        }
        nextVC.delegate = self
        nextVC.vc2NewName = textField1.text!

        if let navigator = navigationController {
            navigator.pushViewController(nextVC, animated: true)
        }
    }

    func changeText(newName: String) {
        nameLabel1.text = newName
    }
    
    func blankTextField() {
        textField1.text = ""
    }
    
}

