//
//  DestinationDetailsViewController.swift
//  DreamDestination
//
//  Created by Максим Назаров on 14.02.2025.
//

import UIKit

final class DestinationDetailsViewController: UIViewController {
    
    @IBOutlet var destinationNameLabel: UILabel!
    @IBOutlet var destinationDescriptionLabel: UILabel!
    
    @IBOutlet var destinationImageView: UIImageView!
    
    
    var country: Country?

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    
}

private extension DestinationDetailsViewController {
    func configure() {
        guard let existingCountry = country else { return }
        destinationNameLabel.text = existingCountry.name
        destinationImageView.image = UIImage(named: existingCountry.image)
        destinationDescriptionLabel.text = existingCountry.description
    }
}
