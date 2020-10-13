//
//  EventDetailViewModel.swift
//  Teste-Dev-iOS-Woop-Sicredi
//
//  Created by Rodrigo Giglio on 12/06/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import Foundation

protocol EventDetailViewModelDelegate: class {

}

class EventDetailViewModel {
    
    // MARK: - Attributes
    weak var delegate: EventDetailViewModelDelegate?
    var event: Event?
    
    
    // MARK: - Computed Attributes
    var shouldDisplayParticipants: Bool {
        guard let event = event else { return false }
        return !event.people.isEmpty
    }
    
    var displayedInformation: [EventDetailCellType] {
        if shouldDisplayParticipants {
            return [.image, .details, .address, .participants, .description]
        } else {
            return [.image, .details, .address, .description]
        }
    }
    
    
    // MARK: - Public Methods
    public func seeMap() {    
        guard let event = event else { return }
        Geocoding.openMap(event.latitude, event.longitude, pinName: event.title)
    }
}
