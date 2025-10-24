//
//  ViewController.swift
//  CD-Alerts
//
//  Created by Lucas Chiang on 10/1/25.
//

import UIKit

let choices = ["Simple UIAlrtViewController", "UIAlertViewController with Multiple Buttons", "Standard UIActionSheet", "UIAlertViewController with TextField"]

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    let textCellIdentifier = "TextCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
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
        let rowValue = choices[indexPath.row] //string appearing inside the cell
        
        switch indexPath.row {
        case 0: //simple
            let controller = UIAlertController(title: "Alert Controller",
                                               message: rowValue,
                                               preferredStyle: .alert)

            controller.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            controller.addAction(UIAlertAction(title: "OK", style: .default))
            
            present(controller, animated:true)
        case 1: // multiple buttons
            let controller = UIAlertController(title: "Alert Controller",
                                               message: rowValue,
                                               preferredStyle: .alert)

            controller.addAction(UIAlertAction(title: "Once", style: .default, handler: alertHandler))
            controller.addAction(UIAlertAction(title: "Two", style: .default, handler: {(alert) in print("Two clicked")}))
            controller.addAction(UIAlertAction(title: "Three", style: .default)
                                 {
                                    (alert) in print("Three clicked")
                                 })
            controller.addAction(UIAlertAction(title: "Four", style: .default))
            controller.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            
            // CUA Common User Access - Cancel allows appear at the bottom of the stack and if horizontal, on the left
            
            present(controller, animated:true)
        case 2: // action sheet
            let controller = UIAlertController(title: "Alert Sheet",
                                               message: rowValue,
                                               preferredStyle: .actionSheet)

            controller.addAction(UIAlertAction(title: "Cancel", style: .cancel) { (action) in print("Cancel Action")})
            controller.addAction(UIAlertAction(title: "OK", style: .default))
            
            present(controller, animated:true)
            
        case 3: // with text field
            let controller = UIAlertController(title: "Alert Controller",
                                               message: rowValue,
                                               preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            
            // Dynamically create a text field: addtextField()
            //  takes a FUNCTION as a parameter that creates a
            //  UITextField object and adds the text field to an
            //  array called "textFields"
            
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
        default: // required
            makePopup(popupTitle: "Generic Popup Message", popupMessage: "Something went wrong")
            
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
        
        present(controller, animated:true)
    }
}

