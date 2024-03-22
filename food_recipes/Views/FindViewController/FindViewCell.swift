//
//  FindViewCell.swift
//  food_recipes
//
//  Created by Kirill Atrakhimovich on 22.03.24.
//

import Foundation

import UIKit

class FindViewCell: NiblessViewCell {
    static let identifier = "FindViewListCell"
    
    var dishTitle: UILabel = {
            var dishTitle = UILabel()
        dishTitle.translatesAutoresizingMaskIntoConstraints = false
        dishTitle.textColor = .black
        dishTitle.font = UIFont.systemFont(ofSize: 21.0)
        dishTitle.numberOfLines = 0
        dishTitle.text = "JRATfafafadfaVA"
            return dishTitle
        }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: .default, reuseIdentifier: "FindViewListCell")
            self.backgroundColor = .clear
            setTitle()
            isUserInteractionEnabled = true
            selectionStyle = .none
            contentView.isHidden = true
        }
    
    private func setTitle() {
        self.addSubview(dishTitle)
        NSLayoutConstraint.activate([
            dishTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            dishTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
