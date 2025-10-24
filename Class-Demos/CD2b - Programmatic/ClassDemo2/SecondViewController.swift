//
//  SecondViewController.swift
//  ClassDemo2
//
//  Created by bulko on 6/19/19.
//  Copyright © 2019 bulko. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var titleLabel2: UILabel!
    var nameLabel2: UILabel!
    var textField2: UITextField!
    var button2: UIButton!
    
    var delegate: UIViewController!
    var vc2NewName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        
        titleLabel2 = UILabel(frame: CGRect(x:20, y:100, width:100, height:30))
        titleLabel2.textAlignment = NSTextAlignment.center
        titleLabel2.text = "VC2"
        titleLabel2.center = CGPoint(x: view.bounds.midX, y:100)
        self.view.addSubview(titleLabel2)
        
        nameLabel2 = UILabel(frame: CGRect(x:20, y:150, width:view.bounds.width, height:30))
        nameLabel2.textAlignment = NSTextAlignment.left
        nameLabel2.text = vc2NewName
        self.view.addSubview(nameLabel2)
        
        textField2 = UITextField(frame: CGRect(x:20, y:200, width:view.bounds.width-50, height:30))
        textField2.borderStyle = UITextField.BorderStyle.line
        textField2.text = ""
        self.view.addSubview(textField2)
        
        button2 = UIButton(type: .roundedRect)
        button2.frame = CGRect(x:20, y:300, width:50, height:30)
        button2.setTitle("Enter", for: .normal)
        button2.center = CGPoint(x: view.bounds.midX, y: 300)
        button2.addTarget(self, action: #selector(button2Pressed), for: .touchUpInside)
        self.view.addSubview(button2)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // what happens when you use viewDidAppear() instead?
        nameLabel2.text = vc2NewName
    }
    
    @objc func button2Pressed(_ sender: Any) {
        
        let firstVC = delegate as! TextChanger
        firstVC.changeText(newName:textField2.text!)
        firstVC.blankTextField()
        
        if let navigator = navigationController {
            navigator.popViewController(animated: true)
        }
    }
    
}
