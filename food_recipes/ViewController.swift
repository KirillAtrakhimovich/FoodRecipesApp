//
//  ViewController.swift
//  food_recipes
//
//  Created by Kirill Atrakhimovich on 19.09.23.
//

import UIKit
import Moya

class ViewController: NiblessViewController {
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
            self.networkManager = networkManager
            super.init()
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        networkManager.getResult()
    
        
    }
    
    


}

