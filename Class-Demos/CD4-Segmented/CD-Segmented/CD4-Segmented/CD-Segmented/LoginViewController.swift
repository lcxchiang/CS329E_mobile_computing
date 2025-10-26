//
//  LoginViewController.swift
//  CD-Segmented
//
//  Created by bulko on 10/8/25.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var errorMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Auth.auth().addStateDidChangeListener() { (auth, user) in
            if user != nil {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                self.emailField.text = nil
                self.passwordField.text = nil
            }
        }
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: emailField.text!, password: passwordField.text!) { (result, error) in
            if let error = error as NSError? {
                self.errorMessage.text = "Error \(error.localizedDescription)"
            } else {
                self.errorMessage.text = ""
            }
        }
        
    }
    
    @IBAction func signupButtonPressed(_ sender: Any) {
        
        let alert = UIAlertController(
            title: "Register",
            message: "Register",
            preferredStyle: .alert)
        
        alert.addTextField() { (tfEmail) in
            tfEmail.placeholder = "Enter your email"
        }
        
        alert.addTextField() { (tfPassword) in
            tfPassword.placeholder = "Enter your password"
            tfPassword.isSecureTextEntry = true
        }
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            let emailField = alert.textFields![0]
            let passwordField = alert.textFields![1]
            
            // create a new user here
            
            Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!) { (result, error) in
                if let error = error as NSError? {
                    self.errorMessage.text = "Error \(error.localizedDescription)"
                } else {
                    self.errorMessage.text = ""
                }
            }
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
        
    }
    
}
