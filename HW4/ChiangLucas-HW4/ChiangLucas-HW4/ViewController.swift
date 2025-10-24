//
//  ViewController.swift
//  ChiangLucas-HW4
//
//  Created by Lucas Chiang on 10/5/25.
//

// Project: ChiangLucas-HW4
// EID: lmc4866
// Course: CS329E

import UIKit

// global variables
public var selectedPip = -1
public var selectedSuit = -1

class ViewController: UIViewController {

    @IBOutlet weak var selectPipText: UILabel!
    @IBOutlet weak var selectSuitText: UILabel!

    @IBOutlet weak var guessLabel: UILabel!
    @IBOutlet weak var pipLabel: UILabel!
    @IBOutlet weak var suitLabel: UILabel!
    
    @IBOutlet weak var pipButton: UIButton!
    @IBOutlet weak var suitButton: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    
    var correctPip = Int.random(in: 0..<pips.count)
    var correctSuit = Int.random(in: 0..<suits.count)

    var guessCount = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        guessLabel.text = ""
        pipLabel.text = ""
        suitLabel.text = ""
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(selectedPip)
        print(selectedSuit)

        // If selected not -1, then set the labels as the selected values
        if (selectedPip >= 0 && selectedPip < pips.count) {
            selectPipText.text = "Pip: \(pips[selectedPip])"
        }

        if (selectedSuit >= 0 && selectedSuit < suits.count) {
            selectSuitText.text = "Suit: \(suits[selectedSuit])"
        }
    }

    @IBAction func buttonPressed(_ sender: Any) {

        // Check if values have been selected
        if (selectedPip == -1 || selectedSuit == -1) {
            guessLabel.textColor = .red
            guessLabel.text = "Select a pip value and suit first"
            return
        }

        // Evaluating the pip value selected
        if (selectedPip < correctPip) {
            pipLabel.textColor = .red
            pipLabel.text = "Your pip value is too low"
        }
        else if (selectedPip > correctPip) {
            pipLabel.textColor = .red
            pipLabel.text = "Your pip value is too high"
        }
        else {
            pipLabel.textColor = UIColor(red: 0/255, green: 100/255, blue: 0/255, alpha: 1.0)
            pipLabel.text = "Correct pip value"
        }
        
        // Evaluating the suit value selected
        if (selectedSuit != correctSuit) {
            suitLabel.textColor = .red
            suitLabel.text = "Incorrect suit"
        }
        else {
            suitLabel.textColor = UIColor(red: 0/255, green: 100/255, blue: 0/255, alpha: 1.0)
            suitLabel.text = "Correct suit"
        }

        guessCount += 1
        guessLabel.text = "Guesses so far: \(guessCount)"

        // Evaluate if both are correct
        if (selectedSuit == correctSuit && selectedPip == correctPip) {
            guessLabel.textColor = UIColor(red: 0/255, green: 100/255, blue: 0/255, alpha: 1.0)
            guessLabel.text = "You guessed correctly in \(guessCount) tries!"
            
            // deactivate all buttons (Game has ended)
            pipButton.isEnabled = false
            suitButton.isEnabled  = false
            submitButton.isEnabled = false
        }

    }

}
