//
//  DestinationsViewController.swift
//  DreamDestination
//
//  Created by Максим Назаров on 14.02.2025.
//

import UIKit

final class DestinationsViewController: UITableViewController {
    
    private let hotCountries = Country.getCountries().filter { $0.climate == .hot}
    private let coldCountries = Country.getCountries().filter { $0.climate == .cold}
    private let temperateCountries = Country.getCountries().filter { $0.climate == .temperate}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 280
    }

}

// MARK: - UITableViewDataSource
extension DestinationsViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return hotCountries.count
        case 1:
            return coldCountries.count
        default:
            return temperateCountries.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "destinationCell", for: indexPath)
        guard let destinationCell = cell as? DestinationCell else { return cell}
        switch indexPath.section {
        case 0:
            destinationCell.configure(with: hotCountries[indexPath.row])
        case 1:
            destinationCell.configure(with: coldCountries[indexPath.row])
        default :
            destinationCell.configure(with: temperateCountries[indexPath.row])
        }
        
        return destinationCell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return Climate.hot.rawValue
        case 1:
            return Climate.cold.rawValue
        default:
            return Climate.temperate.rawValue
        }
    }
}


// MARK: - Routing

extension DestinationsViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailsVC = segue.destination as? DestinationDetailsViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        switch indexPath.section {
        case 0:
            detailsVC.country = hotCountries[indexPath.row]
        case 1:
            detailsVC.country = coldCountries[indexPath.row]
        default :
            detailsVC.country = temperateCountries[indexPath.row]
        }
    }
}
