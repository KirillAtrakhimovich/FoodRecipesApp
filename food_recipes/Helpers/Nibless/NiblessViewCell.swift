//
//  NiblessViewCell.swift
//  food_recipes
//
//  Created by Kirill Atrakhimovich on 4.10.23.
//

import Foundation
import UIKit

open class NiblessViewCell: UITableViewCell {
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    @available(*, unavailable, message: "Loading this view from a nib is unsupported in favor of initializer dependency injection.")
    public required init?(coder: NSCoder) {
        fatalError(Constants.error)
    }
}

extension NiblessViewCell {
    struct Constants {
        static let message = "Loading this view from a nib is unsupported in favor of initializer dependency injection."
        static let error = "Loading this view from a nib is unsupported in favor of initializer dependency injection."
    }
}
