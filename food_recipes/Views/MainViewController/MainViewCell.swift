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
    
    var dishTitle: UILabel = {
            var dishTitle = UILabel()
        dishTitle.translatesAutoresizingMaskIntoConstraints = false
        dishTitle.textColor = .white
        dishTitle.font = UIFont.systemFont(ofSize: 26.0)
        dishTitle.numberOfLines = 0
            return dishTitle
        }()
    
    var dishSubtitle: UILabel = {
            var dishSubtitle = UILabel()
        dishSubtitle.translatesAutoresizingMaskIntoConstraints = false
        dishSubtitle.textColor = .black
        dishSubtitle.font = UIFont.systemFont(ofSize: 18.0)
        dishSubtitle.text = "Subtitle"
        dishSubtitle.numberOfLines = 0
            return dishSubtitle
        }()
    var favouriteButton: UIButton = {
            var favouriteButton = UIButton()
        favouriteButton.translatesAutoresizingMaskIntoConstraints = false
        favouriteButton.setImage(UIImage(systemName: "star"), for: .normal)
            return favouriteButton
        }()
    
    var dishImage: UIImageView = {
        var dishImage = UIImageView()
        dishImage.translatesAutoresizingMaskIntoConstraints = false
        dishImage.backgroundColor = .blue
        return dishImage
    }()
    
    let titleAndSubtitleView: UIStackView = {
        let titleAndSubtitleView = UIStackView()
        titleAndSubtitleView.translatesAutoresizingMaskIntoConstraints = false
        titleAndSubtitleView.spacing = 1
        titleAndSubtitleView.axis = .vertical
        titleAndSubtitleView.alignment = .fill
        return titleAndSubtitleView
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: .default, reuseIdentifier: "MainViewListCell")
            self.backgroundColor = .green
            setDishImage()
            setTitleAndSubtitleView()
            setFavouriteButton()
            setTitleAndSubtitle()
            isUserInteractionEnabled = true
            selectionStyle = .none
            contentView.isHidden = true
            contentPriority()
        }
    
    private func contentPriority() {
        dishTitle.setContentCompressionResistancePriority(UILayoutPriority.defaultLow, for: .horizontal)
        favouriteButton.setContentCompressionResistancePriority(UILayoutPriority.defaultHigh, for: .horizontal)
        dishTitle.setContentHuggingPriority(UILayoutPriority.defaultLow, for:.horizontal)
        favouriteButton.setContentHuggingPriority(UILayoutPriority.defaultHigh, for:.horizontal)
        }
    
    func setupInfo(recipe: RecipeItem) {
        dishTitle.text = recipe.label
    }
    
    func updateImage(image: UIImage) {
        dishImage.image = image
    }
    
    private func setDishImage() {
        self.addSubview(dishImage)
        NSLayoutConstraint.activate([
            dishImage.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor,  constant: 10),
            dishImage.heightAnchor.constraint(equalToConstant: 50),
            dishImage.widthAnchor.constraint(equalToConstant: 50),
            dishImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
    
    private func setTitleAndSubtitleView() {
        self.addSubview(titleAndSubtitleView)
        NSLayoutConstraint.activate([
            titleAndSubtitleView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            titleAndSubtitleView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            titleAndSubtitleView.leftAnchor.constraint(equalTo: dishImage.rightAnchor, constant: 10),

        ])
    }
    
    private func setTitleAndSubtitle() {
        titleAndSubtitleView.addArrangedSubview(dishTitle)
        titleAndSubtitleView.addArrangedSubview(dishSubtitle)
    }

    
    private func setFavouriteButton() {
        self.addSubview(favouriteButton)
        NSLayoutConstraint.activate([
            favouriteButton.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor,  constant: -10),
            favouriteButton.leftAnchor.constraint(equalTo: titleAndSubtitleView.rightAnchor, constant: 20),
            favouriteButton.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
