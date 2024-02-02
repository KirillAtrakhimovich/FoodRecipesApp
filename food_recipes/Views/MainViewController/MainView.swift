//
//  MainView.swift
//  food_recipes
//
//  Created by Kirill Atrakhimovich on 4.10.23.
//

import UIKit
import Foundation

@available(iOS 15.0, *)
class MainView: UIView {   
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MainViewCell.self, forCellReuseIdentifier: MainViewCell.identifier)
        tableView.backgroundColor = .blue
        tableView.separatorColor = .black
        return tableView
    }()
    
    func setup() {
        backgroundColor = .white
        setMainStackViewConstraints()
    }
    
    
    private func setMainStackViewConstraints() {
        self.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
        ])
    }
    
}
