//
//  MainPageViewController.swift
//  DomAvto
//
//  Created by Ильмир Шарафутдинов on 28.03.2024.
//

import UIKit


class MainPageViewController: UIViewController {
    let categories = GoodsCategoriesManager().data
    let collectionView = MyCollectionView()
    
    override func loadView() {
        view = collectionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectiionView.delegate = self
        collectionView.collectiionView.dataSource = self
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        navigationController?.navigationBar.shadowImage = UIImage()
//        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.topItem?.title = "Категории"
        let addItem = UIBarButtonItem(title: nil, image: UIImage(named: "notification"), target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItem = addItem
    }
    
    @objc
    func addTapped() {
        
    }
}


extension MainPageViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? MyCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.cellPhotoImageView.image = UIImage(named: categories[indexPath.row].image)
        cell.goodsNameLabel.text = categories[indexPath.row].name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: 115, height: 115)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailController = DetailViewController()
        detailController.imageName = categories[indexPath.row].image
        navigationController?.pushViewController(detailController, animated: true)
    }
}

//class MainPageViewController: UIViewController {
//
//    lazy var myLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .darkGray
//        label.numberOfLines = 1
//        label.font = UIFont.boldSystemFont(ofSize: 30)
//        label.textAlignment = .center
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        view.backgroundColor = .red
//        myLabel.text = UserDefaults.standard.string(forKey: "currentUser")
//        view.addSubview(myLabel)
//        NSLayoutConstraint.activate([
//            myLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            myLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//
//            ])
//    }
//
//}
