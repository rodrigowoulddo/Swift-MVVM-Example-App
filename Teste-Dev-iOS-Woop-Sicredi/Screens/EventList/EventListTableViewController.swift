//
//  ViewController.swift
//  Teste-Dev-iOS-Woop-Sicredi
//
//  Created by Rodrigo Giglio on 11/06/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import UIKit

class EventListTableViewController: UITableViewController {
    
    // MARK: - Attributes
    private let viewModel = EventListViewModel()
       
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTableView()
        setupSearchBar()
        setUpRefreshControl()
        setupViewModel()
    }
    
    
    // MARK: - Configuration
    private func setUpTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setupViewModel() {
        viewModel.delegate = self
        viewModel.fetchEvents()
    }
    
    private func setupSearchBar() {
        navigationItem.searchController = UISearchController.defaultSearchController(searchBarDelegate: self, textFieldDelegate: self)
    }
    
    private func setUpRefreshControl() {
        self.refreshControl?.addTarget(self, action: #selector(handleRefresh), for: UIControl.Event.valueChanged)

    }
    
    // MARK: - Private Methods
    @objc private func handleRefresh() {
        viewModel.fetchEvents()
    }
}


// MARK: - EventListViewModelDelegate
extension EventListTableViewController: EventListViewModelDelegate {
   
    func didLoadEvents() {
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
        /// In case the list was updated by a pull-refresh
        refreshControl?.endRefreshing()
    }
    
    func didFailedToLoadEvents(errorTitle: String, errorDescription: String) {
        // TODO
    }
}


// MARK: - UITableViewDataSource
extension EventListTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.events.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let event = viewModel.events[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EventTableViewCell.identifier) as? EventTableViewCell else { return UITableViewCell() }
        
        cell.configure(with: event)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 165
    }
}


// MARK: - UITableViewDelegate
extension EventListTableViewController {
    
}


// MARK: - UISearchBarDelegate
extension EventListTableViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        
        searchBar.setShowsCancelButton(true, animated: true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.text = String.empty
        searchBar.resignFirstResponder()
        
        viewModel.cancelSearch()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.isEmpty {
            viewModel.cancelSearch()
        }
        else {
            viewModel.applySearch(withFilter: searchText)
        }
    }
}


// MARK: - UITextFieldDelegate
extension EventListTableViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
}

