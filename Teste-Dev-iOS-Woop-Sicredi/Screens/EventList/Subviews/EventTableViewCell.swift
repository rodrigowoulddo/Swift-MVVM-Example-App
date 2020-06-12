//
//  EventTableViewCell.swift
//  Teste-Dev-iOS-Woop-Sicredi
//
//  Created by Rodrigo Giglio on 11/06/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    
    // MARK: - Constants
    public static let identifier: String = "EventTableViewCell"
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var imageImageView: UIImageView!
    

    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    // MARK: - Configuration
    func configure(with event: Event) {
        
        titleLabel.text = event.title
        dateLabel.text = event.date.formattedString
        descriptionLabel.text = event.description
        addressLabel.text = String.empty // TODO
        priceLabel.text = "R$ \(event.price)"
        imageImageView.setImage(from: event.image, withActivityIndicator: false, withFade: true, fadeDuration: .Normal)
        imageImageView.layer.cornerRadius = 8

    }
}
