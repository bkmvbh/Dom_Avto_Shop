//
//  ThirdViewController.swift
//  DomAvto
//
//  Created by Ильмир Шарафутдинов on 16.04.2024.
//

import UIKit

class SearchViewController: UIViewController {
    
    let fetchGoodsManager = FetchGoodsManager()
    
    let searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите название товара"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let searchCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 190, height: 400)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(DetailCollectionViewCell.self, forCellWithReuseIdentifier: "DetailCollectionViewCell")
        return collectionView
    }()
    
    var goodsArray: [Goods] = []
    var filteredGoods: [Goods] = []
    var selectedType: TypeEnum?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(searchTextField)
        view.addSubview(searchCollectionView)
        
        searchCollectionView.delegate = self
        searchCollectionView.dataSource = self
        searchTextField.addTarget(self, action: #selector(searchTextChanged(_:)), for: .editingChanged)
        
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            searchCollectionView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 10),
            searchCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        fetchGoodsManager.fetchGoods(completion: { [weak self] goods in
            guard let self = self else { return }
            self.goodsArray = goods
            self.filteredGoods = self.goodsArray
            DispatchQueue.main.async {
                self.searchCollectionView.reloadData()
            }
        })
    }
    
    @objc func searchTextChanged(_ textField: UITextField) {
        guard let query = textField.text?.lowercased(), !query.isEmpty else {
            filteredGoods = goodsArray
            searchCollectionView.reloadData()
            return
        }
        filteredGoods = goodsArray.filter { $0.name.lowercased().contains(query) }
        searchCollectionView.reloadData()
    }
}

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredGoods.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailCollectionViewCell", for: indexPath) as? DetailCollectionViewCell else {
            return UICollectionViewCell()
        }
        let goodsItem = filteredGoods[indexPath.row]
        let url = URL(string: goodsItem.avatar)
        cell.cellPhotoImageView.kf.setImage(with: url)
        cell.priceLabel.text = goodsItem.price
        cell.nameLabel.text = goodsItem.name
        cell.pastPriceLabel.text = goodsItem.pastPrice
        cell.descriptionGoodsLabel.text = goodsItem.descriptions
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 190, height: 400)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let goodsViewController = GoodsViewController()
        let goodsItem = filteredGoods[indexPath.row]
        let url = URL(string: goodsItem.avatar)
        goodsViewController.goodId = goodsItem.id
        goodsViewController.cellPhotoImageView.kf.setImage(with: url)
        goodsViewController.priceLabel.text = goodsItem.price
        goodsViewController.pastPriceLabel.text = goodsItem.pastPrice
        goodsViewController.nameLabel.text = goodsItem.name
        goodsViewController.discriptionLabel.text = goodsItem.descriptions

        navigationController?.pushViewController(goodsViewController, animated: true)
    }

}

