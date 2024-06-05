//
//  UserProfileViewController.swift
//  DomAvto
//
//  Created by Ильмир Шарафутдинов on 05.06.2024.
//

import UIKit

class UserProfileViewController: UIViewController {
    
    lazy var dataManager = CoreDataManager.shared
    
    lazy var profileImageView: UIImageView = {
        let profileImageView = UIImageView()
        profileImageView.contentMode = .scaleAspectFit
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        return profileImageView
    }()
    
    
    lazy var nameLabel = createLabel(withText: "Имя: Иван Иванов")
    lazy var usernameLabel = createLabel(withText: "Логин: ivanov123")
    lazy var phoneLabel = createLabel(withText: "Номер телефона: +7 923 456 7890")
    lazy var addressLabel = createLabel(withText: "Адрес: ул. Примерная, д. 1, кв. 1, Москва, Россия")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        setupLayouts()
        setupData()
    }
    
    func setupData() {
        let name = UserDefaults.standard.string(forKey: "currentUser")
        let email = UserDefaults.standard.string(forKey: "emailCurrentUser")
        let users = dataManager.obtainSavedData()
        for user in users {
            if user.name == name {
                nameLabel.text = "Имя: " + (name ?? "")
                usernameLabel.text = "Логин: " + (email ?? "")
                if let data = user.avatarImageView {
                    profileImageView.image = UIImage(data: data)
                }
            }
        }
    }
    
    func addSubviews() {
        view.addSubview(profileImageView)
        view.addSubview(nameLabel)
        view.addSubview(usernameLabel)
        view.addSubview(phoneLabel)
        view.addSubview(addressLabel)
    }
    
    func setupLayouts() {
        view.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            
            profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 100),
            profileImageView.heightAnchor.constraint(equalToConstant: 100),
            
            
            nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            
            usernameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            usernameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            usernameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            phoneLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 10),
            phoneLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            phoneLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            addressLabel.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 10),
            addressLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            addressLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    func createLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}

