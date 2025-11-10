//
//  TimeTableViewCell.swift
//  ChiangLucas-HW7
//
//  Created by Lucas Chiang on 11/3/25.
//

// Project: ChiangLucas-HW7
// EID: lmc4866
// Course: CS329E

import UIKit

class TimeTableViewCell: UITableViewCell {

    let eventLabel = UILabel()
    let locationLabel = UILabel()
    let remainingLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        // adding to subview
        contentView.addSubview(eventLabel)
        contentView.addSubview(remainingLabel)
        contentView.addSubview(locationLabel)

        eventLabel.translatesAutoresizingMaskIntoConstraints = false
        remainingLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.translatesAutoresizingMaskIntoConstraints = false

        remainingLabel.textAlignment = .right

        // Layout
        NSLayoutConstraint.activate([
            eventLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            eventLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            eventLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            remainingLabel.topAnchor.constraint(equalTo: eventLabel.bottomAnchor, constant: 4),
            remainingLabel.leadingAnchor.constraint(equalTo: eventLabel.leadingAnchor),
            remainingLabel.trailingAnchor.constraint(equalTo: eventLabel.trailingAnchor),
            
            locationLabel.topAnchor.constraint(equalTo: remainingLabel.bottomAnchor, constant: 4),
            locationLabel.leadingAnchor.constraint(equalTo: eventLabel.leadingAnchor),
            locationLabel.trailingAnchor.constraint(equalTo: eventLabel.trailingAnchor),
            locationLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with timer: Timer) {
        eventLabel.text = "Event \(timer.event)"
        remainingLabel.text = "Remaining Time(s) \(timer.timeRemaining)"
        locationLabel.text = "Location \(timer.location)"
    }
}
