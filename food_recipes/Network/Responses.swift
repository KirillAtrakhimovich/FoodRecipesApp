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
    func downloadImage(imageURL: String, completion: @escaping (Result<Data, Error>) -> Void)
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
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func downloadImage(imageURL: String, completion: @escaping (Result<Data, Error>) -> Void) {
            guard let downoladImageURL = URL(string: imageURL) else {
                return
            }
            
            let request = URLRequest(url: downoladImageURL)
            
            URLSession.shared.dataTask(with: request) { data, _, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let data = data else {
//                    completion(.failure(NetworkError.emptyData))
                    return
                }
                completion(.success(data))
                
            }.resume()
        }
}
