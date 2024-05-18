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
                    // написать какой нибудь алерт что пользователь с таким именем уже существует
                }
            }
            let user = User(context: dataManager.viewContext)
            user.name = loginView.nameTextField.text
            user.email = loginView.loginTextField.text
            user.password = loginView.passwordTextField.text
            dataSource.append(user)
            dataManager.saveContext()
            UserDefaults.standard.set(user.name, forKey: "currentUser")
            UserDefaults.standard.set(user.email, forKey: "emailCurrentUser")
            let mainTabBarController = MainTabBarController()
            mainTabBarController.modalPresentationStyle = .fullScreen

            self.present(mainTabBarController, animated: true, completion: nil)
        }
    }
    
    func didTapSignInButton() {
//        let mainTabBarController = MainTabBarController()
//        mainTabBarController.modalPresentationStyle = .fullScreen
//
//        self.present(mainTabBarController, animated: true, completion: nil)
        for user in dataManager.obtainSavedData() {
            if loginView.loginTextField.text == user.email && loginView.passwordTextField.text == user.password {
                UserDefaults.standard.set(user.name, forKey: "currentUser")
                UserDefaults.standard.set(user.email, forKey: "emailCurrentUser")
                let mainTabBarController = MainTabBarController()
                mainTabBarController.modalPresentationStyle = .fullScreen

                self.present(mainTabBarController, animated: true, completion: nil)
            }
            else {
                print("fatal error")
            }
        }
    }
}
