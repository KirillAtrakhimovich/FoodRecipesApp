//
//  MainViewListCell.swift
//  food_recipes
//
//  Created by Kirill Atrakhimovich on 4.10.23.
//

import Foundation
import UIKit

class MainViewCell: NiblessViewCell {
    static let identifier = "MainViewListCell"
    
    var dishName: UILabel = {
            var dishName = UILabel()
        dishName.translatesAutoresizingMaskIntoConstraints = false
        dishName.textColor = .white
        dishName.numberOfLines = 0
            return dishName
        }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: .default, reuseIdentifier: "MainViewListCell")
            self.backgroundColor = .green
            setDishNameConstraints()
//            contentPriority()
        }
    
//    private func contentPriority() {
//            gameTitle.setContentCompressionResistancePriority(UILayoutPriority.defaultLow, for: .horizontal)
//            gamePrice.setContentCompressionResistancePriority(UILayoutPriority.defaultHigh, for: .horizontal)
//            gameTitle.setContentHuggingPriority(UILayoutPriority.defaultLow, for:.horizontal)
//            gamePrice.setContentHuggingPriority(UILayoutPriority.defaultHigh, for:.horizontal)
//        }
    
    
    private func setDishNameConstraints() {
        self.addSubview(dishName)
        dishName.text = "123"
        NSLayoutConstraint.activate([
            dishName.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            dishName.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    override func awakeFromNib() {
            super.awakeFromNib()
        }
        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
        }
}
