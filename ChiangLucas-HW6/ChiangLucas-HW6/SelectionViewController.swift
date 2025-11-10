//
//  SelectionViewController.swift
//  ChiangLucas-HW5
//
//  Created by Lucas Chiang on 10/14/25.
//

// Project: ChiangLucas-HW6
// EID: lmc4866
// Course: CS329E

import UIKit
import FirebaseFirestore

class SelectionViewController: UIViewController {

    @IBOutlet weak var segCtrl: UISegmentedControl!
    @IBOutlet weak var pizzaLabel: UILabel!
    
    let db = Firestore.firestore()

    var delegate: UIViewController!

    var pizzaSize = "small"
    var crust = ""
    var cheese = ""
    var meat = ""
    var veggies = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        pizzaLabel.text = ""
        pizzaLabel.numberOfLines = 5
    }

    // Pizza Size
    @IBAction func onSegmentChanged(_ sender: Any) {
        switch segCtrl.selectedSegmentIndex {
        case 0:
            pizzaSize = "small"
        case 1:
            pizzaSize = "medium"
        case 2:
            pizzaSize = "large"
        default:
            pizzaSize = "Illegal segment selected"
        }
    }

    // Crust
    @IBAction func crustSelect(_ sender: Any) {
        let controller = UIAlertController (title: "Select crust", message: "Choose a crust type:", preferredStyle: .alert)

        controller.addAction(UIAlertAction(title: "Thin crust", style: .default) {(alert) in
            self.crust = "thin crust"
        })

        controller.addAction(UIAlertAction(title: "Thick crust", style: .default) {(alert) in
            self.crust = "thick crust"
        })

        present(controller, animated: true)
    }

    // Cheese select
    @IBAction func cheeseSelect(_ sender: Any) {
        let controller = UIAlertController(title: "Select Cheese", message: "Choose a cheese type:", preferredStyle: .actionSheet)

        controller.addAction(UIAlertAction(title: "Regular cheese", style: .default) {(alert) in
            self.cheese = "regular cheese"
        })

        controller.addAction(UIAlertAction(title: "No cheese", style: .default) {(alert) in
            self.cheese = "no cheese"
        })

        controller.addAction(UIAlertAction(title: "Double cheese", style: .default) {(alert) in
            self.cheese = "double cheese"
        })

        present(controller, animated: true)

    }

    // Meat select
    @IBAction func selectMeat(_ sender: Any) {
        let controller = UIAlertController(title: "Select Meat", message: "Choose one meat:", preferredStyle: .actionSheet)

        controller.addAction(UIAlertAction(title: "Pepperoni", style: .default) {(alert) in
            self.meat = "pepperoni"
        })

        controller.addAction(UIAlertAction(title: "Sausage", style: .default) {(alert) in
            self.meat = "sausage"
        })

        controller.addAction(UIAlertAction(title: "Canadian Bacon", style: .default) {(alert) in
            self.meat = "canadian bacon"
        })

        present(controller, animated: true)

    }

    // Veggie select
    @IBAction func veggieSelect(_ sender: Any) {
        let controller = UIAlertController(title: "Select veggies", message: "Choose your veggies", preferredStyle: .actionSheet)

        controller.addAction(UIAlertAction(title: "Mushroom", style: .default) {(alert) in
            self.veggies = "mushroom"
        })

        controller.addAction(UIAlertAction(title: "Onion", style: .default) {(alert) in
            self.veggies = "onion"
        })

        controller.addAction(UIAlertAction(title: "Green Olive", style: .default) {(alert) in
            self.veggies = "green olive"
        })

        controller.addAction(UIAlertAction(title: "Black Olive", style: .default) {(alert) in
            self.veggies = "black olive"
        })

        controller.addAction(UIAlertAction(title: "None", style: .default) {(alert) in
            self.veggies = "none"
        })

        present(controller, animated: true)
    }

    @IBAction func donePressed(_ sender: Any) {

        if (crust == "") {
            let controller = UIAlertController(title: "Missing Ingredient", message: "please select a crust type", preferredStyle: .alert)
            controller.addAction(UIAlertAction(title: "OK", style: .cancel))
            present(controller, animated: true)
        }
        else if (cheese == "") {
            let controller = UIAlertController(title: "Missing Ingredient", message: "please select a cheese", preferredStyle: .alert)
            controller.addAction(UIAlertAction(title: "OK", style: .cancel))
            present(controller, animated: true)
        }
        else if (meat == "") {
            let controller = UIAlertController(title: "Missing Ingredient", message: "please select a meat", preferredStyle: .alert)
            controller.addAction(UIAlertAction(title: "OK", style: .cancel))
            present(controller, animated: true)
        }
        else if (veggies == "") {
            let controller = UIAlertController(title: "Missing Ingredient", message: "please select a veggie", preferredStyle: .alert)
            controller.addAction(UIAlertAction(title: "OK", style: .cancel))
            present(controller, animated: true)
        }
        else {
            var ref: DocumentReference? = nil
            
            ref = db.collection("pizza").document()
            ref!.setData(["pizzaSize": pizzaSize, "crust": crust, "cheese": cheese, "meat": meat, "veggies": veggies, "id": ref!.documentID]) { err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    print("Document added with ID: \(ref!.documentID)")
                }
            }
            pizzaLabel.text = "One \(pizzaSize) pizza with:\n\t\(crust)\n\t\(cheese)\n\t\(meat)\n\t\(veggies)"
        }

    }

}
