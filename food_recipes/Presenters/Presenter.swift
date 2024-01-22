//
//  Presenter.swift
//  food_recipes
//
//  Created by Kirill Atrakhimovich on 13.10.23.
//

import UIKit

protocol MainViewProtocol: AnyObject {
    func setTable(data: String)
}

protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, model: RecipeItem)
    func showTable()
}

class MainPresenter: MainViewPresenterProtocol {
    func showTable() {
        let data = self.model.label
        self.view.setTable(data: data)
    }
    
    let view: MainViewProtocol
    let model: RecipeItem
    
    required init(view: MainViewProtocol, model: RecipeItem) {
        self.view = view
        self.model = model
    }
}

