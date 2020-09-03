//
//  ContactListViewController.swift
//  contacts
//
//  Created by Ryniere dos Santos Silva on 2020-09-02.
//  Copyright © 2020 Ryniere dos Santos Silva. All rights reserved.
//

import UIKit

class ContactListViewController: UIViewController {
    
    fileprivate let viewModel = ContactListViewModel()

    @IBOutlet weak var contactsTableView: UITableView!
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Contacts"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        searchController.searchBar.delegate = self
        
        initViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.fetchContacts()
    }
    
    func initViewModel() {
        
        // Setup for reloadTableViewClosure
        viewModel.reloadTableViewClosure = { [weak self] () in
            DispatchQueue.main.async {
                self?.contactsTableView.reloadData()
            }
        }
        
    }
    
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
      let searchBarScopeIsFiltering = searchController.searchBar.selectedScopeButtonIndex != 0
      return searchController.isActive && (!isSearchBarEmpty || searchBarScopeIsFiltering)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ContactListViewController : UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! ContactTableViewCell
        
        let contact = isFiltering ? viewModel.filteredContacts[indexPath.row] : viewModel.contacts[indexPath.row];
        
        cell.configureWith(contact: contact)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isFiltering ? viewModel.filteredContacts.count : viewModel.contacts.count
    }
    
}

extension ContactListViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    let searchBar = searchController.searchBar
    
    guard let text = searchBar.text  else {
        return
    }
   
    viewModel.filterContacts(text: text.lowercased())
  }
}

extension ContactListViewController: UISearchBarDelegate {
  func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
   
  }
}
