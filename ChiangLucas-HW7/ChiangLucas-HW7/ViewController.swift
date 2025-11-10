//
//  ViewController.swift
//  ChiangLucas-HW7
//
//  Created by Lucas Chiang on 11/3/25.
//

// Project: ChiangLucas-HW7
// EID: lmc4866
// Course: CS329E

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddTimer {
    
    var timerList:[Timer] = []

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.title = "Timer"
        
        tableView.register(TimeTableViewCell.self, forCellReuseIdentifier: "timerCell")
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem = addButton
        self.navigationItem.backButtonTitle = "Timer"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    @objc func addButtonTapped() {
        performSegue(withIdentifier: "addTimerSegue", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timerList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "timerCell", for: indexPath) as? TimeTableViewCell else {
            return UITableViewCell()
        }

        let timer = timerList[indexPath.row]
        cell.configure(with: timer)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selection = timerList[indexPath.row]
        performSegue(withIdentifier: "cellSegue", sender: selection)
        tableView.deselectRow(at:indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addTimerSegue",
           let nextVC = segue.destination as? TimerViewController {
            nextVC.delegate = self
        }
        
        if segue.identifier == "cellSegue",
           let nextVC = segue.destination as? CountdownViewController,
           let timer = sender as? Timer {
            nextVC.timer = timer
        }
    }
    
    func addTimer(Timer: Timer) {
        timerList.append(Timer)
        tableView.reloadData()
    }

}
