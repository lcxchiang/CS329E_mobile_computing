//
//  ViewController.swift
//  CD-Firestore
//
//  Created by bulko on 10/13/25.
//

import UIKit
import FirebaseFirestore

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var newItemField: UITextField!
    
    var textCellIdentifier = "TextCell"
    var items = [String]()
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        reloadTable()
    }

    @IBAction func addItemClicked(_ sender: Any) {
        
        var ref: DocumentReference? = nil
        
        ref = db.collection("elements").addDocument(data: ["name": newItemField.text!]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
        
        newItemField.text = ""
        reloadTable()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = items[indexPath.row]
        cell.contentConfiguration = content
        
        return cell
    }
    
    func reloadTable() {
        
        items = [String]()      // resets our data source to "empty" array
        
        db.collection("elements").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    if let name = document.data()["name"] as? String {
                        self.items.append(name)
                    }
                }
                self.tableView.reloadData()
            }
        }
    }
    
    
    
    
    
}

