//
//  PersonCollectionViewCell.swift
//  MVVM Example
//
//  Created by Rodrigo Giglio on 13/10/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import UIKit

class PersonCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Constants
    public static let identifier: String = "PersonCollectionViewCell"
    
    // MARK: - Outlets
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    // MARK: - Configuration
    public func configure(with person: Person) {
        self.avatarImageView.setImage(from: person.picture)
        self.nameLabel.text = person.name
    }
}
