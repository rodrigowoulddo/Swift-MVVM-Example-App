//
//  EventImageTableViewCell.swift
//  Teste-Dev-iOS-Woop-Sicredi
//
//  Created by Rodrigo Giglio on 12/06/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import UIKit

class EventImageTableViewCell: UITableViewCell, EventDetailTableViewCell {

    // MARK: - Constants
    public static let identifier: String = "EventImageTableViewCell"
    
    
    // MARK: - Outlets
    @IBOutlet weak var imageImageView: UIImageView!
    
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Configuration
    func configure(with event: Event) {
        imageImageView.setImage(from: event.image, withActivityIndicator: false, withFade: true, fadeDuration: .Normal)
    }
}
