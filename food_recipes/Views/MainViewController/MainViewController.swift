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
    var recipes: RecipesNetworkModel?
    var recipeItems: [RecipeItem]?
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
                self.recipes = try? JSONDecoder().decode(RecipesNetworkModel.self, from: data)
                print(self.recipes?.hits ?? "2")
              
            case .failure(let error):
                print(error.errorDescription ?? "Unknown error")
            }
        }
    }
    
}

@available(iOS 15.0, *)
extension MainViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes?.hits.count ?? 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainViewCell.identifier, for: indexPath) as? MainViewCell else {
            return UITableViewCell()
        }
        if let recipe = recipes?.hits[indexPath.row].recipe {
                    cell.textLabel?.text = recipe.label
                    print(recipe.label)
                }
        cell.isUserInteractionEnabled = true
        cell.selectionStyle = .none
        cell.contentView.isHidden = true
        return cell
    }
}
