//
//  FindView.swift
//  food_recipes
//
//  Created by Kirill Atrakhimovich on 4.10.23.
//

import UIKit

class FindView: UIView {
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.barStyle = .black
        searchBar.layer.cornerRadius = searchBar.frame.height / 2
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "Search dish..."
        searchBar.searchBarStyle = .minimal
        searchBar.barTintColor = .white
        if let textField = searchBar.value(forKey: "searchField") as? UITextField,
           let iconView = textField.leftView as? UIImageView {
            textField.tintColor = .black
            textField.textColor = .black
            iconView.image = iconView.image?.withRenderingMode(.alwaysTemplate)
            iconView.tintColor = .gray
        }
        return searchBar
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(FindViewCell.self, forCellReuseIdentifier: FindViewCell.identifier)
        tableView.separatorColor = .gray
        return tableView
    }()
    
    func setup() {
        backgroundColor = .clear
        searchBarConstraints()
        tableConstraints()
    }
    
    
    private func searchBarConstraints() {
        self.addSubview(searchBar)
        NSLayoutConstraint.activate([
            searchBar.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            searchBar.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
        ])
    }
    
    private func tableConstraints() {
        self.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
        ])
    }
}

