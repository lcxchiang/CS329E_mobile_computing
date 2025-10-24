//
//  ViewController.swift
//  ChiangLucas-HW5
//
//  Created by Lucas Chiang on 10/13/25.
//

// Project: ChiangLucas-HW5
// EID: lmc4866
// Course: CS329E

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddPizza {

    @IBOutlet weak var tableView: UITableView!
    
    var pizzaList:[Pizza] = []

    let textCellIdentifier = "textCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.title = "Pizza Order"
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem = addButton
        self.navigationItem.backButtonTitle = "Pizza Order"
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
    
    func addPizza(Pizza: Pizza) {
        pizzaList.append(Pizza)
        tableView.reloadData()
    }
    
}

