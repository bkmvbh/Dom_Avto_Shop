//
//  ViewController.swift
//  DomAvto
//
//  Created by Ильмир Шарафутдинов on 27.03.2024.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, LoginViewDelegate {
    
    let loginView = LoginView()
    
    var dataSource: [User] = []
    
    lazy var dataManager = CoreDataManager.shared
    
    override func loadView() {
        view = loginView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.delegate = self
        loginView.signUpButton.layer.cornerRadius = 7
        view.backgroundColor = .white
    }
    
    func didTapSignUpButton() {
        if loginView.passwordTextField.text == loginView.returnPasswordTextField.text &&
            loginView.nameTextField.text?.replacingOccurrences(of: " ", with: "") != "" &&
            loginView.loginTextField.text?.replacingOccurrences(of: " ", with: "") != "" &&
            loginView.passwordTextField.text?.replacingOccurrences(of: " ", with: "") != "" {
            for user in dataManager.obtainSavedData() {
                if user.name == loginView.nameTextField.text {
                    return
                }
            }
            let user = User(context: dataManager.viewContext)
            user.name = loginView.nameTextField.text
            user.email = loginView.loginTextField.text
            user.password = loginView.passwordTextField.text
            dataSource.append(user)
            dataManager.saveContext()
            UserDefaults.standard.set(user.name, forKey: "currentUser")
            let mainPageVC = MainPageViewController()
            present(mainPageVC, animated: true, completion: nil)
        }
    }
}
