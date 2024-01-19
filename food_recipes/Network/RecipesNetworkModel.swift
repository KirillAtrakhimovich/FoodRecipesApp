//
//  RecipesModel.swift
//  food_recipes
//
//  Created by Kirill Atrakhimovich on 21.09.23.
//

import Foundation


struct RecipesNetworkModel: Decodable {
    var hits = [RecipeNetworkModel]()
}

struct RecipeNetworkModel: Decodable {
    let recipe : RecipeNetworkItem
}

struct RecipeNetworkItem: Decodable {
    let uri: String
    let label: String
    let image: String

}
