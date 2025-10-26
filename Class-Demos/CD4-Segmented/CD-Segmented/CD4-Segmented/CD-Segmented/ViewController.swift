//
//  ViewController.swift
//  CD-Segmented
//
//  Created by bulko on 9/29/25.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var segCtrl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onSegmentChanged(_ sender: Any) {
        
        switch segCtrl.selectedSegmentIndex {
        case 0:
            textLabel.text = "First is selected"
            performSegue(withIdentifier: "VC1", sender: self)
        case 1:
            textLabel.text = "Second is selected"
            performSegue(withIdentifier: "VC2", sender: self)
        case 2:
            textLabel.text = "Third is selected"
        case 3:
            textLabel.text = "Fourth is selected"
        default:
            textLabel.text = "Illegal segment selected"
        }
        
    }
    
    @IBAction func logoutButtonPressed(_ sender: Any) {
        
        do {
            try Auth.auth().signOut()
            self.dismiss(animated: true)
        } catch {
            print("Sign out error")
        }
        
        
    }
}

