//
//  SecondViewController.swift
//  DomAvto
//
//  Created by Ильмир Шарафутдинов on 16.04.2024.
//

import UIKit

//import UIKit
//
//class SecondViewController: UIViewController {
//    let containerView = ProfileTableView()
//    var dataSource: UITableViewDiffableDataSource<Int, Tasks>?
//    let dataBase = DataBaseManager()
//
//    var filteredTasks: [Tasks] = []
//
//    override func loadView() {
//        view = containerView
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        containerView.tableView.delegate = self
//        setupDataSource()
//    }
//
//    func setupDataSource() {
//        dataSource = UITableViewDiffableDataSource(tableView: containerView.tableView, cellProvider: { tableView, indexPath, task in
//            if indexPath.row == 0 {
//                let name = UserDefaults.standard.string(forKey: "currentUser")
//                let email = UserDefaults.standard.string(forKey: "emailCurrentUser")
//                let cell = tableView.dequeueReusableCell(withIdentifier:
//                                                            ProfileTableViewCell.reuseIdentifier, for: indexPath) as! ProfileTableViewCell
//                cell.configureCell(name: name ?? "", image: "", email: email ?? "")
//                return cell
//            }
//            let cell = UITableViewCell()
//            cell.textLabel?.text = ProfileCellName.value(at: indexPath.row - 1)?.rawValue
//            return cell
//        })
//        updateDataSource(with: dataBase.getAllTasks())
//    }
//
//    func updateDataSource(with tasks: [Tasks]) {
//        var snapshot = NSDiffableDataSourceSnapshot<Int, Tasks>()
//        snapshot.appendSections([0])
//        snapshot.appendItems(tasks)
//        dataSource?.apply(snapshot)
//    }
//}
//
//extension SecondViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.row == 0 {
//            return 88
//        }
//        return 60
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: false)
//
//        return
//    }
//}
class SecondViewController: UIViewController {
    let containerView = ProfileTableView()
    
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
            cell.configureCell(name: name ?? "", image: "", email: email ?? "")
            cell.selectionStyle = .none
            return cell
        }
        let cell = UITableViewCell()
        cell.textLabel?.text = ProfileCellName.value(at: indexPath.row - 1)?.rawValue
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 88
        }
        return 60
    }
}

enum ProfileCellName: String {
    case addCard = "Добавить карту"
    case myOrders = "Мои заказы"
    case informationForUser = "Информация об учетной записи"
    case settings = "Настройки"
    case support = "Поддержка"
    case logout = "Выйти"
    
    
    static func value(at index: Int) -> ProfileCellName? {
        let allValues = [addCard, myOrders, informationForUser, settings, support, logout]
        guard index >= 0, index < allValues.count else {
            return nil
        }
        return allValues[index]
    }
}
