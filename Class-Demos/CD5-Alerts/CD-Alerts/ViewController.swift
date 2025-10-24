//
//  ViewController.swift
//  CD-Alerts
//
//  Created by bulko on 10/1/25.
//

import UIKit

let choices = [ "Simple UIAlertViewController",
                "UIAlertViewController with Multiple Buttons",
                "Standard UIActionSheet",
                "UIAlertViewController with TextField"
]

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let textCellIdentifier = "TextCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return choices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = choices[indexPath.row]
        cell.contentConfiguration = content
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        let rowValue = choices[indexPath.row]
        
        switch indexPath.row {
        case 0:  // Simple
            
            let controller = UIAlertController(
                title: "Alert Controller",
                message: rowValue,
                preferredStyle: .alert)
            
            controller.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            controller.addAction(UIAlertAction(title: "OK", style: .default))
            
            present(controller, animated: true)
            
        case 1:  // Multiple buttons
            
            let controller = UIAlertController(
                title: "Alert Controller",
                message: rowValue,
                preferredStyle: .alert)
            
            controller.addAction(UIAlertAction(title: "One", style: .default, handler:
                                                { (alert) in print("One clicked")
                                                }
                                               ))
            controller.addAction(UIAlertAction(title: "Two", style: .default) {
                (alert) in print("Two clicked")
            } )
            controller.addAction(UIAlertAction(title: "Three", style: .default, handler: alertHandler))
            controller.addAction(UIAlertAction(title: "Four", style: .default))
            controller.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            
            present(controller, animated: true)
            
        case 2:  // Action Sheet
            
            let controller = UIAlertController(
                title: "Action Sheet",
                message: rowValue,
                preferredStyle: .actionSheet)
            
            controller.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            controller.addAction(UIAlertAction(title: "OK", style: .default))
            
            present(controller, animated: true)
            
        case 3:  // with textField
            
            let controller = UIAlertController(
                title: "Alert Controller",
                message: rowValue,
                preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            
            // Dynamically create a text field.  addTextField()
            //    takes a FUNCTION as a parameter that creates a
            //    UITextField object and adds the text field to an
            //    array called "textfields".
            
            controller.addTextField() {
                (textField) in textField.placeholder = "Enter something"
            }
            
            let okAction = UIAlertAction(title: "OK", style: .default) {
                (action) in
                let enteredText = controller.textFields![0].text
                print(enteredText!)
            }
            
            controller.addAction(cancelAction)
            controller.addAction(okAction)
            
            present(controller, animated: true)
  
        default:
            makePopup(popupTitle: "Generic Error Message", popupMessage: "Something went wrong")
        }
    }
    
    func alertHandler(alert:UIAlertAction) {
        print("Message")
    }
    
    func makePopup(popupTitle:String, popupMessage:String) {
        
        let controller = UIAlertController(
            title: popupTitle,
            message: popupMessage,
            preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        controller.addAction(okAction)
        
        present(controller, animated: true)
        
    }

}

