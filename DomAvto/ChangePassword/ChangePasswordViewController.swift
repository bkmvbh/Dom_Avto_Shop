//
//  ChangePasswordViewController.swift
//  DomAvto
//
//  Created by Ильмир Шарафутдинов on 05.06.2024.
//

import UIKit

class ChangePasswordViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    lazy var dataManager = CoreDataManager.shared
    
    private let tableView = UITableView(frame: .zero, style: .grouped)
    private let oldPasswordTextField = UITextField()
    private let newPasswordTextField = UITextField()
    private let saveButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGroupedBackground
        title = "Настройки"
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tableView)
        
        saveButton.setTitle("Сохранить", for: .normal)
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(saveButton)
        
       
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        
        NSLayoutConstraint.activate([
            saveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
       
        configureTextField(oldPasswordTextField, withPlaceholder: "Старый пароль")
        configureTextField(newPasswordTextField, withPlaceholder: "Новый пароль")
    }
    
    
    private func configureTextField(_ textField: UITextField, withPlaceholder placeholder: String) {
        textField.placeholder = placeholder
        textField.isSecureTextEntry = true
        textField.clearButtonMode = .whileEditing
        textField.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = "Поменять пароль"
            cell.textLabel?.textAlignment = .center
            cell.selectionStyle = .none
        case 1:
            cell.contentView.addSubview(oldPasswordTextField)
            NSLayoutConstraint.activate([
                oldPasswordTextField.topAnchor.constraint(equalTo: cell.contentView.topAnchor),
                oldPasswordTextField.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor),
                oldPasswordTextField.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 15),
                oldPasswordTextField.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -15)
            ])
        case 2:
            cell.contentView.addSubview(newPasswordTextField)
            NSLayoutConstraint.activate([
                newPasswordTextField.topAnchor.constraint(equalTo: cell.contentView.topAnchor),
                newPasswordTextField.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor),
                newPasswordTextField.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 15),
                newPasswordTextField.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -15)
            ])
        default:
            break
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section != 0 {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    @objc private func saveButtonTapped() {
        guard let user = getGurrentUser() else { return }
        if user.password == oldPasswordTextField.text {
            user.password = newPasswordTextField.text
            dataManager.saveContext()
            let alert = UIAlertController(title: nil, message: "Пароль обновлен", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: { _ in
                self.navigationController?.popViewController(animated: true)
            })
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: nil, message: "Неверно введен старый пароль", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    func getGurrentUser() -> User? {
        let name = UserDefaults.standard.string(forKey: "currentUser")
        let email = UserDefaults.standard.string(forKey: "emailCurrentUser")
        let users = dataManager.obtainSavedData()
        for user in users {
            if user.name == name {
                return user
            }
        }
        return nil
    }
}
