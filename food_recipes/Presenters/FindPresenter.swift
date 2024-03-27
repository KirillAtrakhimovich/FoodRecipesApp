//
//  Presenter.swift
//  food_recipes
//
//  Created by Kirill Atrakhimovich on 13.10.23.
//

import UIKit

protocol FindViewProtocol: AnyObject {
    func getRecipesSuccess(recipes: [RecipeItem])
    func getRecipesFailure(errorMassage: String)
}

protocol FindViewPresenterProtocol: AnyObject {
    init(view: FindViewProtocol, networkService: NetworkServiceProtocol)
    func getRecipes(search: String)
    func uploadDishImage(imageURL: String, completion: @escaping (UIImage) -> Void)
}

class FindPresenter: FindViewPresenterProtocol {

    private var recipes = [RecipeItem]()
    private weak var view: FindViewProtocol?
    private let networkService: NetworkServiceProtocol
    
    required init(view: FindViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
    }
    
    func getRecipes(search: String) {
        networkService.getRecipes(input: GetRecipesInput(search: search)) { [weak self] result in
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


