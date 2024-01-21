//
//  ViewController.swift
//  food_recipes
//
//  Created by Kirill Atrakhimovich on 19.09.23.
//

import UIKit
import Moya

@available(iOS 15.0, *)
class MainViewController: NiblessViewController, UITableViewDelegate {
    let provider = MoyaProvider<MoyaExampleService>()
    var recipeItems: [RecipeItem]? {
        didSet {
            mainView.tableView.reloadData()
        }
    }
    private let mainView = MainView()
    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getResponse()
        mainView.setup()
        setupTableSettings()
    }
    
    private func setupTableSettings() {
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
    }
    
    private func getResponse() {
        provider.request(.getRecipes) { [self] result in
            switch result {
            case .success(let moyaResponse):
                let data = moyaResponse.data
                let recipes = try? JSONDecoder().decode(RecipesNetworkModel.self, from: data)
                recipeItems = recipes?.hits.map { RecipeItem(uri: $0.recipe.uri, label: $0.recipe.label, image: $0.recipe.image) }
//                print(self.recipes?.hits ?? "2")
            
            case .failure(let error):
                print(error.errorDescription ?? "Unknown error")
            }
        }
    }
    
}

@available(iOS 15.0, *)
extension MainViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        recipeItems?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainViewCell.identifier, for: indexPath) as? MainViewCell else {
            return UITableViewCell()
        }
        guard let recipe = recipeItems?[indexPath.row] else {
            return UITableViewCell()
        }
        cell.setupInfo(recipe: recipe)
        return cell
    }
}
