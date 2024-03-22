//
//  FindViewController.swift
//  food_recipes
//
//  Created by Kirill Atrakhimovich on 4.10.23.
//

import Foundation
import UIKit

class FindViewCotroller: NiblessViewController, UITableViewDelegate {
    
    
    let findView = FindView()
    
    override func loadView() {
        view = findView
    }
    
    override func viewDidLoad() {
        findView.setup()
        setupTableSettings()
        setupSearchBarSettings()
    }
    
    private func setupTableSettings() {
        findView.tableView.dataSource = self
        findView.tableView.delegate = self
    }
    
    private func setupSearchBarSettings() {
        findView.searchBar.delegate = self
        findView.searchBar.returnKeyType = UIReturnKeyType.done
    }
}

extension FindViewCotroller: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FindViewCell.identifier, for: indexPath) as? FindViewCell else {
                    return UITableViewCell()
                }
        return cell
    }
    
}


extension FindViewCotroller: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        model?.filterGames(with: searchText)
//        customView.tableView.reloadData()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
}
