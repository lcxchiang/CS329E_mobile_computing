//
//  ViewController.swift
//  CD-StackViews
//
//  Created by bulko on 10/24/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    let imageCount = 6      // number of images
    var current = 0         // current image
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showImage(0)
        
        let actions = [
            UIAction(title: "Image 0") { _ in self.showImage(0) },
            UIAction(title: "Image 1") { _ in self.showImage(1) },
            UIAction(title: "Image 2") { _ in self.showImage(2) },
            UIAction(title: "Image 3") { _ in self.showImage(3) },
            UIAction(title: "Image 4") { _ in self.showImage(4) },
            UIAction(title: "Image 5") { _ in self.showImage(5) }
        ]
        
        let menu = UIMenu(title: "My Menu", options: .displayInline, children: actions)
        displayButton.menu = menu
        displayButton.showsMenuAsPrimaryAction = true
        
    }
    
    func showImage(_ index:Int) {
        displayButton.setTitle("Image \(index)", for: .normal)
        imageView.image = UIImage(named: "image\(index)")
    }

    @IBAction func onPreviousButtonPressed(_ sender: Any) {
        current = (current + imageCount - 1) % imageCount
        showImage(current)
    }
    
    @IBAction func onResetButtonPressed(_ sender: Any) {
        showImage(0)
        current = 0
    }
    
    @IBAction func onNextButtonPressed(_ sender: Any) {
        current = (current + 1) % imageCount
        showImage(current)

    }
    
}

