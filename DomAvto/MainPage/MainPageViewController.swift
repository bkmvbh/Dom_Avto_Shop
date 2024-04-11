//
//  MainPageViewController.swift
//  DomAvto
//
//  Created by Ильмир Шарафутдинов on 28.03.2024.
//

import UIKit

class MainPageViewController: UIViewController {
    
    lazy var myLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.numberOfLines = 1
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        myLabel.text = UserDefaults.standard.string(forKey: "currentUser")
        view.addSubview(myLabel)
        NSLayoutConstraint.activate([
            myLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            
            ])
    }
    
}
