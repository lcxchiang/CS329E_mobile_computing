// Project: ChiangLucas-HW3
// EID: lmc4866
// Course: CS329E

import UIKit

class TextViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!

    var delegate: UIViewController!
    var tvcHolder = "" // Placeholder for the text field passed from the updated text on the main screen

    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        textField.placeholder = tvcHolder
    }

    @IBAction func buttonPressed(_ sender: Any) {
        let otherVC = delegate as! TextChanger

        if (textField.text != "") { // Only change the text on the main screen if the user has typed something
            otherVC.changeText(newName: textField.text!)
        }
        else {
            return
        }
    }

    // Code for removing the software keyboard from the screen
    func textFieldShouldReturn(_ textField:UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}
