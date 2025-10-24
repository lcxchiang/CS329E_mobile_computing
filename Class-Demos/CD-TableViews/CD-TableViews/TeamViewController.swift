//
//  TeamViewController.swift
//  CD-TableViews
//
//  Created by bulko on 9/22/25.
//

import UIKit

class TeamViewController: UIViewController {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var teamLabel: UILabel!
    
    let teamSegueIdentifier = "TeamSegueIdentifier"
    var teamName = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        teamLabel.text = "Team selected: \(teamName)"
        let teamIndex = teams.firstIndex(of: teamName)
        cityLabel.text = "City: \(cities[teamIndex!])"
    }

}
