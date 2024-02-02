//
//  Responses.swift
//  food_recipes
//
//  Created by Kirill Atrakhimovich on 24.01.24.
//

import UIKit
import Moya

protocol NetworkServiceProtocol {
    func getRecipes(completion: @escaping (Result<RecipesNetworkModel, Error>) -> Void)
}

final class NetworkService: NetworkServiceProtocol {
    private let provider = MoyaProvider<MoyaExampleService>()
    
    func getRecipes(completion: @escaping (Result<RecipesNetworkModel, Error>) -> Void) {
        provider.request(.getRecipes) { result in
            switch result {
            case .success(let moyaResponse):
                let data = moyaResponse.data
                
                guard let recipes = try? JSONDecoder().decode(RecipesNetworkModel.self, from: data) else { completion(.failure(NSError(domain: "", code: 0)))
                    return
                }
                completion(.success(recipes))
                
                
//               
//                self.labels = recipeItems
//                self.view.success()
                
            case .failure(let error):
//                self.view.failure()
//                print(error.errorDescription ?? "Unknown error")
                completion(.failure(error))
            }
        }
    }
}
