//
//  TabViewController.swift
//  food_recipes
//
//  Created by Kirill Atrakhimovich on 4.10.23.
//

import UIKit

@available(iOS 15.0, *)
final class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        viewSettings()
        setupVCs()
        navBarSettings()
    }
    
    private func viewSettings() {
        view.backgroundColor = UIColor.white
    }

    func setupVCs() {
        viewControllers = [
            createNavController(for: ModuleBuilder.createModule(), title: "Home", image: UIImage(systemName: "house")!),
            createNavController(for: ModuleBuilder.createFindModule(), title: "Find", image: UIImage(systemName: "magnifyingglass")!),
            createNavController(for: FavouritesViewController(), title: "Favourites", image: UIImage(systemName: "star.fill")!),
            createNavController(for: SettingsViewController(), title: "Settings", image: UIImage(systemName: "gear")!)
        ]
    }

     func createNavController(for rootViewController: UIViewController,
                                                      title: String,
                                                      image: UIImage
                                                      ) -> UINavigationController {
        let navController = UINavigationController(rootViewController: rootViewController)
         navController.tabBarItem.title = title
         navController.tabBarItem.image = image
         navController.navigationBar.topItem?.title = title
         navController.navigationItem.backButtonTitle = Constants.empty
        
        return navController
    }
    
    private func navBarSettings() {
         
            let navigationBarAppearance = UINavigationBarAppearance()
                            navigationBarAppearance.configureWithOpaqueBackground()
                            navigationBarAppearance.titleTextAttributes = [
                                NSAttributedString.Key.foregroundColor : UIColor.black
                            ]
            navigationBarAppearance.backgroundColor = Constants.mainColor
                            UINavigationBar.appearance().standardAppearance = navigationBarAppearance
                            UINavigationBar.appearance().compactAppearance = navigationBarAppearance
                            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
            
            let tabBarApperance = UITabBarAppearance()
                        tabBarApperance.configureWithOpaqueBackground()
                        tabBarApperance.backgroundColor = Constants.mainColor
                        UITabBar.appearance().scrollEdgeAppearance = tabBarApperance
                        UITabBar.appearance().standardAppearance = tabBarApperance
        
    }
}

@available(iOS 15.0, *)
extension TabBarController {
    struct Constants {
        static let empty = ""
        static let mainColor = #colorLiteral(red: 0.87265414, green: 0.9323428869, blue: 0.9991553426, alpha: 1)
        static let listIcon = UIImage(systemName: "list.star")!
        static let favsIcon = UIImage(systemName: "star.fill")!
        static let newsIcon = UIImage(systemName: "book.fill")!
        static let listTitle = "Games"
        static let favsTitle = "Favs"
        static let newsTitle = "News"
    }
}
