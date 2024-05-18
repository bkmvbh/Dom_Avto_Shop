//
//  DetailViewController.swift
//  DomAvto
//
//  Created by Ильмир Шарафутдинов on 25.04.2024.
//

import UIKit

class DetailViewController: UIViewController {

    let detailCollectionView = DetailCollectionView()
    let categories = GoodsCategoriesManager().data
    var imageName = ""
    
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
//
    }
}
extension DetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailCollectionViewCell", for: indexPath) as? DetailCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.cellPhotoImageView.image = UIImage(named: imageName)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: 190, height: 400)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let goodsViewController = GoodsViewController()
        goodsViewController.imageName = imageName
        navigationController?.pushViewController(goodsViewController, animated: true)
    }
}
