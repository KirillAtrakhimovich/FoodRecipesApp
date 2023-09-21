//
//  NetworkManager.swift
//  food_recipes
//
//  Created by Kirill Atrakhimovich on 19.09.23.
//

import Foundation
import UIKit

enum NetworkError: Error {
    case invalidURL
    case emptyData
    case parsingError
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Was sending invalid URL."
        case .emptyData:
            return "No data here."
        case .parsingError:
            return "Met parsing error."
        }
    }
}

final class NetworkManager {
    
    let stringURL = "https://api.edamam.com/api/recipes/v2."
    let stringURL2 = "https://store.steampowered.com/api/appdetails?appids="
    func downloadImage(imageURL: String, completion: @escaping (Result<UIImage, Error>) -> Void) {
        guard let downoladImageURL = URL(string: stringURL) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        let request = URLRequest(url: downoladImageURL)
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.emptyData))
                print(data ?? "jopa")
                return
            }
            
            if let image =  UIImage(data: data) {
                completion(.success(image))
            } else {
                completion(.failure(NetworkError.parsingError))
            }
        }.resume()
    }
    
    func getResult() {
        if let url = URL(string: stringURL) {
            
            // Создаем URLSession
            let session = URLSession.shared
            
            // Создаем задачу (task) для выполнения GET-запроса
            let task = session.dataTask(with: url) { (data, response, error) in
                
                // Проверяем на наличие ошибок
                if let error = error {
                    print("Ошибка: \(error)")
                } else if let data = data {
                    // Если данные получены успешно, вы можете выполнить дополнительную обработку
                    // Например, преобразовать данные в строку или JSON
                    if let responseString = String(data: data, encoding: .utf8) {
                        print("Ответ сервера: \(responseString)")
                    }
                }
            }
            
            // Запускаем задачу
            task.resume()
        }


    }
}
