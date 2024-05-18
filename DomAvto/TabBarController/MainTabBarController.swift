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
        let thirdViewController = ThirdViewController()
        
        let boldConfig = UIImage.SymbolConfiguration(weight: .medium)
        let convImage = UIImage(systemName: "bubble.left.and.bubble.right", withConfiguration: boldConfig)!
        let peopleImage = UIImage(systemName: "person.2", withConfiguration: boldConfig)!
        let carImage = UIImage(systemName: "car", withConfiguration: boldConfig)!
        
        viewControllers = [
            generateNavigationController(rootViewController: mainPageViewController, title: "Advanced", image: carImage),
            generateNavigationController(rootViewController: secondViewController, title: "Compositional", image: peopleImage),
           generateNavigationController(rootViewController: thirdViewController, title: "Flow", image: convImage)
           
            
            
        ]
    }
    
    private func generateNavigationController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
    
}
