//
//  PipViewController.swift
//  ChiangLucas-HW4
//
//  Created by Lucas Chiang on 10/5/25.
//

// Project: ChiangLucas-HW4
// EID: lmc4866
// Course: CS329E

import UIKit

public let pips = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]

class PipViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    let textCellIdentifier = "PipCell"
    let segueIdentifier = "pipSegue"

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pips.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = pips[indexPath.row]

        cell.contentConfiguration = content
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedPip = indexPath.row
        navigationController?.popViewController(animated: true)
    }

}
