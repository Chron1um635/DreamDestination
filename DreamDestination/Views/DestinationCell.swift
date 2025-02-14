//
//  DestinationCell.swift
//  DreamDestination
//
//  Created by Максим Назаров on 14.02.2025.
//

import UIKit

final class DestinationCell: UITableViewCell {
    
    @IBOutlet var destinationNameLabel: UILabel!
    @IBOutlet var destinationPriceLabel: UILabel!
    @IBOutlet var destinationDurationLabel: UILabel!
    
    @IBOutlet var destinationImageView: UIImageView!
    
    func configure(with country: Country) {
        destinationNameLabel.text = country.name
        destinationImageView.image = UIImage(named: country.image)
        destinationPriceLabel.text = "Стоимость за день: \(country.dailyBudget)"
        destinationDurationLabel.text = "Длительность: \(country.duration)"
    }
}
