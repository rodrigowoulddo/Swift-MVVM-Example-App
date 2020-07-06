//
//  EventDataTableViewCell.swift
//  Teste-Dev-iOS-Woop-Sicredi
//
//  Created by Rodrigo Giglio on 12/06/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import UIKit

enum EventDetailCellType {
    
    case image
    case details
    case address
    case description
    
    static func atIndex(_ index: Int) -> EventDetailCellType? {
        
        switch index {
            case 0: return .image
            case 1: return .details
            case 2: return .address
            case 3: return .description
            default: return nil
        }
    }
    
    var identifier: String {
        switch self {
            case .image: return EventImageTableViewCell.identifier
            case .details: return EventDetailsTableViewCell.identifier
            case .address: return EventAddressTableViewCell.identifier
            case .description: return EventDescriptionTableViewCell.identifier
        }
    }
    
    var height: CGFloat {
        switch self {
        case .image: return 200
            case .details: return 180
            case .address: return 100
            case .description: return 185
        }
    }
}

protocol EventDetailTableViewCell: UITableViewCell {
    
    // MARK: - Configuration
    func configure(with event: Event)
}
