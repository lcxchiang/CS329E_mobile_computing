//
//  LoginViewController.swift
//  ChiangLucas-HW6
//
//  Created by Lucas Chiang on 10/26/25.
//

// Project: ChiangLucas-HW6
// EID: lmc4866
// Course: CS329E

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var userField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmLabel: UILabel!
    @IBOutlet weak var confirmField: UITextField!
    @IBOutlet weak var segCtrl: UISegmentedControl!
    @IBOutlet weak var signIn: UIButton!
    @IBOutlet weak var statusLabel: UILabel!
    var screenLogin = true

    override func viewDidLoad() {
        super.viewDidLoad()

        // Hide the confirm fields
        confirmLabel.isHidden = true
        confirmField.isHidden = true

        // Set status label to blank
        statusLabel.text = ""

        Auth.auth().addStateDidChangeListener() { (auth, user) in
            if user != nil {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                self.userField.text = nil
                self.passwordField.text = nil
            }
        }
    }

    @IBAction func loginbuttonPressed(_ sender: Any) {
        if screenLogin {
            Auth.auth().signIn(withEmail: userField.text!, password: passwordField.text!) { (result, error) in
                if let error = error as NSError? {
                    self.statusLabel.text = "Error \(error.localizedDescription)"
                } else {
                    self.statusLabel.text = ""
                }
            }
        } else {
            // Check if the confirm field matches the password field
            if passwordField.text == confirmField.text && passwordField.text != "" && userField.text != "" {
                Auth.auth().createUser(withEmail: userField.text!, password: passwordField.text!) { (result, error) in
                    if let error = error as NSError? {
                        self.statusLabel.text = "Error \(error.localizedDescription)"
                    } else {
                        self.statusLabel.text = ""
                        self.confirmField.text = ""
                    }
                }
            } else {
                statusLabel.text = "Error creating a user (check that passwords are the same)"
            }
        }
    }
    
    @IBAction func onSegementChanged(_ sender: Any) {
        
        switch segCtrl.selectedSegmentIndex {
        case 0:
            // Configure the Interface
            screenLogin = true
            confirmLabel.isHidden = true
            confirmField.isHidden = true
            signIn.setTitle("Sign In", for: .normal)
            statusLabel.text = ""
        case 1:
            screenLogin = false
            confirmLabel.isHidden = false
            confirmField.isHidden = false
            signIn.setTitle("Sign Up", for: .normal)
            statusLabel.text = ""
        default:
            print("Segment Error")
        }

    }

}
