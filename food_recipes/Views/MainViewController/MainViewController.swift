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
    var presenter: MainViewPresenterProtocol!
    private let mainView = MainView()
    private var recipeItems: [RecipeItem] = [] {
        didSet {
            mainView.tableView.reloadData()
        }
    }
    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.setup()
        setupTableSettings()
        presenter.getRecipes()
    }
    
    private func setupTableSettings() {
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
    }
}

@available(iOS 15.0, *)
extension MainViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        recipeItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainViewCell.identifier, for: indexPath) as? MainViewCell else {
            return UITableViewCell()
        }
        let recipe = recipeItems[indexPath.row]
        cell.setupInfo(recipe: recipe)
        return cell
    }
}

@available(iOS 15.0, *)
extension MainViewController: MainViewProtocol {
    func success(recipes: [RecipeItem]) {
        recipeItems = recipes
    }
    
    func failure(errorMassage: String) {
        print(errorMassage)
    }
}
