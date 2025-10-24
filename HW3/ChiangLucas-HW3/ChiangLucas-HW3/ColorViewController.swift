// Project: ChiangLucas-HW3
// EID: lmc4866
// Course: CS329E

import UIKit

class ColorViewController: UIViewController {

    var delegate: UIViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func bluePressed(_ sender: Any) {
        let otherVC = delegate as! TextChanger
        otherVC.changeTextColor(newColor:"blue")
    }

    @IBAction func redPressed(_ sender: Any) {
        let otherVC = delegate as! TextChanger
        otherVC.changeTextColor(newColor:"red")
    }

}
