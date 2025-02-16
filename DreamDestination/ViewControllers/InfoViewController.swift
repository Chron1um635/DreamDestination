//
//  InfoViewController.swift
//  DreamDestination
//
//  Created by Максим Назаров on 16.02.2025.
//

import UIKit

final class InfoViewController: UIViewController {
    
    @IBOutlet var maxImageView: UIImageView!
    @IBOutlet var anastasiaImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        maxImageView.layer.cornerRadius = maxImageView.frame.width / 2
        anastasiaImageView.layer.cornerRadius = anastasiaImageView.frame.width / 2
    }

}
