//
//  SuitViewController.swift
//  ChiangLucas-HW4
//
//  Created by Lucas Chiang on 10/5/25.
//

// Project: ChiangLucas-HW4
// EID: lmc4866
// Course: CS329E

import UIKit

public let suits = ["\u{2663} Clubs", "\u{2666} Diamonds", "\u{2665} Hearts", "\u{2660} Spades"]

class SuitViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    let textCellIdentifier = "SuitCell"
    let segueIdentifier = "suitSegue"

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return suits.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = suits[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedSuit = indexPath.row
        navigationController?.popViewController(animated: true)
    }

}
