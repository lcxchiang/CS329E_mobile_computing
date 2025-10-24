// Project: ChiangLucas-HW3
// EID: lmc4866
// Course: CS329E

import UIKit

class ViewController: UIViewController, TextChanger {

    @IBOutlet weak var nameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ColorSegue",
           let nextVC = segue.destination as? ColorViewController {
            nextVC.delegate = self
        }

        else if segue.identifier == "TextSegue",
           let nextVC = segue.destination as? TextViewController {
            nextVC.delegate = self
            nextVC.tvcHolder = nameLabel.text!
        }

    }

    func changeText(newName: String) {
        nameLabel.text = newName
    }

    func changeTextColor(newColor: String) {
        if (newColor.lowercased() == "blue") {
            nameLabel.backgroundColor = UIColor.blue
        }
        else if (newColor.lowercased() == "red") {
            nameLabel.backgroundColor = UIColor.red
        }
    }

}
