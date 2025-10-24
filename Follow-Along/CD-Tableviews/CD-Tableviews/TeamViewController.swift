//
//  TeamViewController.swift
//  CD-Tableviews
//
//  Created by Lucas Chiang on 9/22/25.
//

import UIKit

class TeamViewController: UIViewController {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var teamLabel: UILabel!

    let teamSegueIdentifier = "TeamSegueIdentifier"
    var teamName = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        teamLabel.text = "Team selected : \(teamName)"
        let teamIndex = teams.firstIndex(of: teamName)
        cityLabel.text = "City: \(cities[teamIndex!])"
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
