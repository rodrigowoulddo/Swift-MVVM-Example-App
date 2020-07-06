//
//  EventDescriptionTableViewCell.swift
//  Teste-Dev-iOS-Woop-Sicredi
//
//  Created by Rodrigo Giglio on 12/06/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import UIKit

class EventDescriptionTableViewCell: UITableViewCell, EventDetailTableViewCell {

    // MARK: - Constants
    public static let identifier: String = "EventDescriptionTableViewCell"
    
    
    // MARK: - Outlets
    @IBOutlet weak var descriptionTextView: UITextView!
    
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Configuration
    func configure(with event: Event) {
        
        descriptionTextView.text = event.description
    }
}
