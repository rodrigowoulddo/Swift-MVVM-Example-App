//
//  EventListViewModel.swift
//  Teste-Dev-iOS-Woop-Sicredi
//
//  Created by Rodrigo Giglio on 11/06/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import Foundation

protocol EventListViewModelDelegate: class {
    func didLoadEvents()
    func didFailedToLoadEvents(errorTitle: String, errorDescription: String)
}

class EventListViewModel {
    
    // MARK: - Attributes
    weak var delegate: EventListViewModelDelegate?
    let service = Service<EventEndpoints>()
    
    var allEvents: [Event] = []
    var filter: String?
    var showldDisplaySearch: Bool = false
    
    // MARK: - Computed Attributes
    var events: [Event] {
        
        if showldDisplaySearch {
            
            guard let filter = filter else { return [] }
            return allEvents.filter({ $0.title.containsIgnoringCase(filter) })
        }
        else {
            
            return allEvents
        }
    }

    
    // MARK: - Public Methods
    public func fetchEvents() {
        
         service.request(.getAll) {
             (result: Result<[Event],Error>) in
             
            switch result {
            
                case .failure(let error):
                    self.delegate?.didFailedToLoadEvents(errorTitle: "Erro", errorDescription: error.localizedDescription)
                    
                case.success(let events):
                    self.allEvents = events
                    self.delegate?.didLoadEvents()
                
            }
         }
    }
    
    public func applySearch(withFilter filter: String) {
        self.filter = filter
        showldDisplaySearch = true
        delegate?.didLoadEvents()
    }
    
    public func cancelSearch() {
        filter = nil
        showldDisplaySearch = false
        delegate?.didLoadEvents()
    }
}
