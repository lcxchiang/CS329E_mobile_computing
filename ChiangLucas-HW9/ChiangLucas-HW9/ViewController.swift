//
//  ViewController.swift
//  ChiangLucas-HW9
//
//  Created by Lucas Chiang on 11/21/25.
//

import UIKit

class ViewController: UIViewController {
    
    var block: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let screenWidth = view.safeAreaLayoutGuide.layoutFrame.width
        let screenHeight = view.safeAreaLayoutGuide.layoutFrame.height
        
        let widthUnit = screenWidth / 9
        let heightUnit = screenHeight / 19

        let blockHeight = heightUnit
        let blockWidth = widthUnit
        
        block = UIView(frame: CGRect(
            x: 4 * widthUnit,
            y: 9 * heightUnit,
            width: blockWidth,
            height: blockHeight))
        block.backgroundColor = .green
        
        view.addSubview(block)
        
    }

}

