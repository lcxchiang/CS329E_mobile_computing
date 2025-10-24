//
//  ViewController.swift
//  CD6-UserDefaults
//
//  Created by bulko on 6/26/25.
//

import UIKit

// Get a reference to the global user defaults object
let defaults = UserDefaults.standard

class ViewController: UIViewController {
    
    @IBOutlet weak var enterInteger: UITextField!
    @IBOutlet weak var enterDouble: UITextField!
    @IBOutlet weak var enterString: UITextField!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var retrievedInteger: UILabel!
    @IBOutlet weak var retrievedDouble: UILabel!
    @IBOutlet weak var retrievedString: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // print contents of User Defaults space in debug window
        print(defaults.dictionaryRepresentation())
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        defaults.set(enterInteger.text, forKey: "enterInteger")
        defaults.set(enterDouble.text, forKey: "enterDouble")
        defaults.set(enterString.text, forKey: "enterString")
        messageLabel.text = "Entered values saved to User Defaults"
        
        print(defaults.dictionaryRepresentation())
    }
    
    @IBAction func retrieveButtonPressed(_ sender: Any) {
        retrievedInteger.text = String(defaults.integer(forKey: "enterInteger"))
        retrievedDouble.text = String(defaults.double(forKey: "enterDouble"))
        retrievedString.text = defaults.string(forKey: "enterString")
        messageLabel.text = "Values retrieved and shown below"
    }
    
    @IBAction func clearButtonPressed(_ sender: Any) {
        defaults.removeObject(forKey: "enterInteger")
        defaults.removeObject(forKey: "enterDouble")
        defaults.removeObject(forKey: "enterString")
        messageLabel.text = "Values saved to User Defaults deleted"
        
        print(defaults.dictionaryRepresentation())
    }
    
}
