//
//  Presenter.swift
//  food_recipes
//
//  Created by Kirill Atrakhimovich on 13.10.23.
//

import UIKit

protocol MainViewProtocol: AnyObject {
    func getRecipesSuccess(recipes: [RecipeItem])
    func getRecipesFailure(errorMassage: String)
}

protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol)
    func getRecipes()
    func uploadDishImage(imageURL: String, completion: @escaping (UIImage) -> Void)
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
                self.view?.getRecipesSuccess(recipes: self.recipes)
            case .failure(let error):
                self.view?.getRecipesFailure(errorMassage: error.localizedDescription)
            }
        }
    }
    
    func uploadDishImage(imageURL: String, completion: @escaping (UIImage) -> Void) {
        networkService.downloadImage(imageURL: imageURL) { result in
               switch result {
               case .success(let dishData):
                       guard let image = UIImage(data: dishData) else { return }
                       completion(image)
                       
                   
                  
               case .failure(let error):
                   print(error)
           }
       }
    }
}
