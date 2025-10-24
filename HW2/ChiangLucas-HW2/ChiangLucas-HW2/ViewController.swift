// Project: ChiangLucas-HW2
// EID: lmc4866
// Course: CS329E

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userField: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var statusLabel: UILabel!

    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view.
        userField.delegate = self
        password.delegate = self

    }

    @IBAction func buttonPressed(_ sender: Any) {

        let userText = userField.text!.trimmingCharacters(in: .whitespaces)
        let passwordText = password.text!.trimmingCharacters(in: .whitespaces)

        if (userText.isEmpty || passwordText.isEmpty) {
            statusLabel.text = "Invalid login"
        }
        else {
            statusLabel.text = "\(userText) logged in"
        }
    }

    // Called when 'return' key pressed

    func textFieldShouldReturn(_ textField:UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    // Called when the user clicks on the view outside of the UITextField

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}
