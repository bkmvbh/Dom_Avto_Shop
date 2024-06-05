//
//  MainTabBarController.swift
//  DomAvto
//
//  Created by Ильмир Шарафутдинов on 16.04.2024.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let mainPageViewController = MainPageViewController()
        let secondViewController = SecondViewController()
        let thirdViewController = SearchViewController()
        let cartViewController = CartViewController()
        
        let boldConfig = UIImage.SymbolConfiguration(weight: .medium)
        let convImage = UIImage(systemName: "magnifyingglass", withConfiguration: boldConfig)!
        let peopleImage = UIImage(systemName: "person.2", withConfiguration: boldConfig)!
        let cartImage = UIImage(systemName: "cart", withConfiguration: boldConfig)!
        let carImage = UIImage(systemName: "house", withConfiguration: boldConfig)!
        
        viewControllers = [
            generateNavigationController(rootViewController: mainPageViewController, title: "", image: carImage),
            generateNavigationController(rootViewController: cartViewController, title: "", image: cartImage),
            generateNavigationController(rootViewController: thirdViewController, title: "", image: convImage),
            
            generateNavigationController(rootViewController: secondViewController, title: "", image: peopleImage),
            
            
        ]
    }
    
    private func generateNavigationController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
    
}
