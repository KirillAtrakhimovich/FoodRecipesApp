//
//  Presenter.swift
//  food_recipes
//
//  Created by Kirill Atrakhimovich on 13.10.23.
//

import UIKit

protocol MainViewProtocol: AnyObject {
    func success(recipes: [RecipeItem])
    func failure(errorMassage: String)
}

protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol)
    func getRecipes()
}

class MainPresenter: MainViewPresenterProtocol {
    
    private var recipes = [RecipeItem]()
    private weak var view: MainViewProtocol?
    private let networkService: NetworkServiceProtocol
    
    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
    }
    
    func getRecipes() {
        networkService.getRecipes { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let recipes):
                self.recipes = recipes.hits.map { RecipeItem(uri: $0.recipe.uri, label: $0.recipe.label, image: $0.recipe.image) }
                self.view?.success(recipes: self.recipes)
            case .failure(let error):
                self.view?.failure(errorMassage: error.localizedDescription)
            }
        }
    }
}
