//
//  SecondViewController.swift
//  DomAvto
//
//  Created by Ильмир Шарафутдинов on 16.04.2024.
//

import UIKit


class SecondViewController: UIViewController {
    let containerView = ProfileTableView()
    lazy var dataManager = CoreDataManager.shared
    
    override func loadView() {
        view = containerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        containerView.tableView.delegate = self
        containerView.tableView.dataSource = self
        containerView.tableView.isScrollEnabled = false
    }
    
}
extension SecondViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let name = UserDefaults.standard.string(forKey: "currentUser")
            let email = UserDefaults.standard.string(forKey: "emailCurrentUser")
            let cell = tableView.dequeueReusableCell(withIdentifier:
                                                        ProfileTableViewCell.reuseIdentifier, for: indexPath) as! ProfileTableViewCell
            let users = dataManager.obtainSavedData()
            for user in users {
                if user.name == name {
                    cell.configureCell(name: name ?? "", image: "", email: email ?? "", avatarImage: user.avatarImageView,  configure: { vc in
                        self.present(vc, animated: true)
                    })
                    
                    cell.selectionStyle = .none
                    return cell
                }
            }
        }
        let cell = UITableViewCell()
        cell.textLabel?.text = ProfileCellName.value(at: indexPath.row - 1)?.rawValue
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 88
        }
        return 60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch ProfileCellName.value(at: indexPath.row - 1) {
        case .addCard:
            let addCardViewController = CardsViewController()
            navigationController?.pushViewController(addCardViewController, animated: true)
            break
        case .informationForUser:
            let userProfileViewController = UserProfileViewController()
            navigationController?.pushViewController(userProfileViewController, animated: true)
            break
        case .settings:
            let changePasswordViewController = ChangePasswordViewController()
            navigationController?.pushViewController(changePasswordViewController, animated: true)
            break
        case .support:
            let supportViewController = SupportViewController()
            navigationController?.pushViewController(supportViewController, animated: true)
            break
        case .logout:
            logout()
            break
        case .none:
            break
        }
    }
    
    func logout() {
        UserDefaults.standard.removeObject(forKey: "currentUser")
        UserDefaults.standard.removeObject(forKey: "emailCurrentUser")
        
        let loginViewController = ViewController()
        let navController = UINavigationController(rootViewController: loginViewController)
        
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = navController
            UIView.transition(with: window, duration: 0.5, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
    }
}

enum ProfileCellName: String {
    case addCard = "Добавить карту"
    case informationForUser = "Информация об учетной записи"
    case settings = "Настройки"
    case support = "Поддержка"
    case logout = "Выйти"
    
    
    static func value(at index: Int) -> ProfileCellName? {
        let allValues = [addCard, informationForUser, settings, support, logout]
        guard index >= 0, index < allValues.count else {
            return nil
        }
        return allValues[index]
    }
}
