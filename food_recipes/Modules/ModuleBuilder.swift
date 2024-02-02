//
//  ModuleBuilder.swift
//  food_recipes
//
//  Created by Kirill Atrakhimovich on 23.01.24.
//

import UIKit

protocol Builder {
    static func createModule() -> UIViewController
}
 
@available(iOS 15.0, *)
class ModuleBuilder: Builder {
    static func createModule() -> UIViewController {
        let networkService = NetworkService()
        let viewController = MainViewController()
        let presenter = MainPresenter(view: viewController, networkService: networkService)
        viewController.presenter = presenter
        return viewController
    }
}
