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
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "123"
        return label
    }()
    
    func setup() {
        backgroundColor = .white
        setMainStackViewConstraints()
//        setLabel()
    }
    
    
    private func setMainStackViewConstraints() {
        self.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -200),
            tableView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
        ])
    }
    
    private func setLabel() {
        self.addSubview(label)
        NSLayoutConstraint.activate([
            label.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            label.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            label.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            label.topAnchor.constraint(equalTo: tableView.bottomAnchor,constant: -20),
        ])
    }
}
