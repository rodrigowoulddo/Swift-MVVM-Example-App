//
//  EventParticipantsTableViewCell.swift
//  MVVM Example
//
//  Created by Rodrigo Giglio on 13/10/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import UIKit

class EventParticipantsTableViewCell: UITableViewCell, EventDetailTableViewCell {
    
    // MARK: - Constants
    public static let identifier: String = "EventParticipantsTableViewCell"
    
    
    // MARK: - Outlets
    @IBOutlet weak var participantsCollectionView: UICollectionView!
    
    
    // MARK: - Attributes
    var participants: [Person]?

    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Configuration
    func configure(with event: Event) {
        self.participants = event.people
        self.participantsCollectionView.dataSource = self
        self.participantsCollectionView.delegate = self
    }
}

extension EventParticipantsTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return participants?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = participantsCollectionView.dequeueReusableCell(withReuseIdentifier: PersonCollectionViewCell.identifier, for: indexPath) as? PersonCollectionViewCell, let person = participants?[indexPath.row] else { return UICollectionViewCell() }
        
        cell.configure(with: person)
        
        return cell
    }
}

extension EventParticipantsTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 110, height: 130)
    }
}
