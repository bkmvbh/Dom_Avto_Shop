//
//  DetailViewController.swift
//  DomAvto
//
//  Created by Ильмир Шарафутдинов on 25.04.2024.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    
    let fetchGoodsManager = FetchGoodsManager()

    let detailCollectionView = DetailCollectionView()
    let categories = GoodsCategoriesManager().data
    var imageName = ""
    var goodsArray: [Goods] = []
    var selectedType: TypeEnum?
    
    override func loadView() {
        view = detailCollectionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailCollectionView.collectiionView.delegate = self
        detailCollectionView.collectiionView.dataSource = self
//        navigationController?.navigationBar.barTintColor = .blue
//        navigationController?.navigationBar.tintColor = .white
//        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        fetchGoodsManager.fetchGoods { goods in
            self.goodsArray = goods
            DataBaseManager.shared.dataSource = goods ?? []
            DispatchQueue.main.async {
                self.detailCollectionView.collectiionView.reloadData()
            }
        }
    }
}

extension DetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let filteredGoods = goodsArray.filter { $0.type == selectedType }
        return filteredGoods.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailCollectionViewCell", for: indexPath) as? DetailCollectionViewCell else {
            return UICollectionViewCell()
        }
        let filteredGoods = goodsArray.filter { $0.type == selectedType }
        if indexPath.row < filteredGoods.count {
           let goodsItem = filteredGoods[indexPath.row]
           let url = URL(string: goodsItem.avatar)
           cell.cellPhotoImageView.kf.setImage(with: url)
           cell.priceLabel.text = goodsItem.price
           cell.nameLabel.text = goodsItem.name
           cell.pastPriceLabel.text = goodsItem.pastPrice
           cell.descriptionGoodsLabel.text = goodsItem.descriptions
       }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: 190, height: 400)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let goodsViewController = GoodsViewController()
        let filteredGoods = goodsArray.filter { $0.type == selectedType }
        if indexPath.row < filteredGoods.count {
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
}
