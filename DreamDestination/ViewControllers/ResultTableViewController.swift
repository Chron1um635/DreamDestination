//
//  ResultTableViewController.swift
//  DreamDestination
//
//  Created by Anastasya Maximova on 16.02.2025.
//

import UIKit

class ResultTableViewController: UITableViewController {
    
    var suitableCountries: [Country]!
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        suitableCountries.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "\(suitableCountries[section].flag)"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let country = suitableCountries[indexPath.section]
        var content = cell.defaultContentConfiguration()
        
        content.secondaryText = country.description
        content.text = country.name
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
