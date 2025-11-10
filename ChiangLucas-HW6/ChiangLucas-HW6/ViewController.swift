//
//  ViewController.swift
//  ChiangLucas-HW5
//
//  Created by Lucas Chiang on 10/13/25.
//

// Project: ChiangLucas-HW6
// EID: lmc4866
// Course: CS329E

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let textCellIdentifier = "textCell"
    
    var pizzaList = [Pizza]()
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.title = "Pizza Order"
        
        // Hide the back button
        self.navigationItem.hidesBackButton = true
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        let signOutButton = UIBarButtonItem(title: "Sign Out", style: .plain, target: self, action: #selector(signOutTapped))
        navigationItem.rightBarButtonItem = addButton
        navigationItem.leftBarButtonItem = signOutButton
        self.navigationItem.backButtonTitle = "Pizza Order"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadTable()
    }
    
    // Add Button
    @objc func addButtonTapped() {
        performSegue(withIdentifier: "designPizzaSegue", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pizzaList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        let pizza = pizzaList[indexPath.row]
        content.text = "\(pizza.pizzaSize)\n\t\(pizza.crust)\n\t\(pizza.cheese)\n\t\(pizza.meat)\n\t\(pizza.veggies)"
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "designPizzaSegue",
           let nextVC = segue.destination as? SelectionViewController {
            nextVC.delegate = self
        }
    }
    
    @objc func signOutTapped() {
        do {
            try Auth.auth().signOut()
            self.navigationController?.popViewController(animated: true)
        } catch {
            print("Sign out error")
        }
    }
    
    func reloadTable() {
        
        pizzaList = [Pizza]()

        db.collection("pizza").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents")
            } else {
                for doc in querySnapshot!.documents {
                    let data = doc.data()
                    if let pizzaSize = data["pizzaSize"] as? String,
                       let crust = data["crust"] as? String,
                       let cheese = data["cheese"] as? String,
                       let meat = data["meat"] as? String,
                       let veggies = data["veggies"] as? String,
                       let id = data["id"] as? String {
                        let pizza = Pizza(pizzaSize: pizzaSize, crust: crust, cheese: cheese, meat: meat, veggies: veggies, id: id)
                        self.pizzaList.append(pizza)
                    }
                }
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let pizzaToDelete = pizzaList[indexPath.row]

            if let id = pizzaToDelete.id {
                db.collection("pizza").document(id).delete { error in
                    if let error = error {
                        print("Error deleting document")
                    } else {
                        print("Successful deletion of document")
                    }
                }
            }

            pizzaList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
