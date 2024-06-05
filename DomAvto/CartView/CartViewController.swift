//
//  CartViewController.swift
//  DomAvto
//
//  Created by Ильмир Шарафутдинов on 23.05.2024.
//

import UIKit

class CartViewController: UIViewController {
   
    let fetchGoodsManager = FetchGoodsManager()
    var goodsArray: [Goods] = []
    
    let cartCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CartCollectionViewCell.self, forCellWithReuseIdentifier: "CartCollectionViewCell")
        return collectionView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cartCollectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupCollectionView()
        setupLayout()
        fetchGoodsManager.fetchGoods { goods in
            self.goodsArray = goods
        }
    }
    
    private func setupCollectionView() {
        cartCollectionView.delegate = self
        cartCollectionView.dataSource = self
        view.addSubview(cartCollectionView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            cartCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            cartCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            cartCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cartCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension CartViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataBaseManager.shared.shoppingCart.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CartCollectionViewCell", for: indexPath) as? CartCollectionViewCell else {
            return UICollectionViewCell()
        }
        let goodsId = DataBaseManager.shared.shoppingCart[indexPath.row]
        if let goodsItem = DataBaseManager.shared.dataSource.first(where: { $0.id == goodsId }) {
            let url = URL(string: goodsItem.avatar)
            cell.cellPhotoImageView.kf.setImage(with: url)
            cell.priceLabel.text = goodsItem.price
            cell.nameLabel.text = goodsItem.name
        }
        cell.removeButton.tag = indexPath.row
        cell.removeButton.addTarget(self, action: #selector(removeItemFromCart(sender:)), for: .touchUpInside)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let goodsViewController = GoodsViewController()
        let filteredGoods = DataBaseManager.shared.shoppingCart.map { id in
            return goodsArray.first(where: { $0.id == id })
        }
        if indexPath.row < filteredGoods.count {
            guard let goodsItem = filteredGoods[indexPath.row] else { return }
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
    
    @objc func removeItemFromCart(sender: UIButton) {
        let index = sender.tag
        let goodsId = DataBaseManager.shared.shoppingCart[index]
        DataBaseManager.shared.removeGood(at: goodsId)
        cartCollectionView.reloadData()
    }
}
