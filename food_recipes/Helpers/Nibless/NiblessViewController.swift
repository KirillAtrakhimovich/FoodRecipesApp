//
//  NiblessViewController.swift
//  food_recipes
//
//  Created by Kirill Atrakhimovich on 19.09.23.
//

import Foundation
import UIKit

public class NiblessViewController: UIViewController {

    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable, message: "Loading this view controller from a nib is unsupported in favor of initializer dependency injection.")
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    @available(*, unavailable, message: "Loading this view controller from a nib is unsupported in favor of initializer dependency injection.")
    public required init?(coder: NSCoder) {
        fatalError("Loading this view controller from a nib is unsupported in favor of initializer dependency injection.")
    }
}
