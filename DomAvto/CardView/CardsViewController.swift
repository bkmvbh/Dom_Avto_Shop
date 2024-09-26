//
//  CardsViewController.swift
//  DomAvto
//
//  Created by Ильмир Шарафутдинов on 04.06.2024.
//

import UIKit
import Foundation

struct Card {
    let cardNumber: String
    let expiryDate: String
    let cvv: String
}

class CardsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var collectionView: UICollectionView!
    var cards: [Card] = [
        Card(cardNumber: "1234 5678 9012 3456", expiryDate: "12/24", cvv: "233"),
        Card(cardNumber: "9876 5432 1098 7654", expiryDate: "11/23", cvv: "444")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        let plusImage = UIImage(systemName: "plus")
        let rightButton = UIBarButtonItem(image: plusImage, style: .plain, target: self, action: #selector(rightButton1Tapped))
                
        
        self.navigationItem.rightBarButtonItems = [rightButton]
    }
    
    @objc func rightButton1Tapped() {
        let addCardViewController = AddCardViewController()
        addCardViewController.successClosure = { [weak self] card in
            self?.cards.append(card)
            self?.collectionView.reloadData()
        }
        navigationController?.pushViewController(addCardViewController, animated: true)
    }

    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width - 40, height: 200)
        layout.minimumLineSpacing = 20
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.register(CardCell.self, forCellWithReuseIdentifier: "CardCell")
        
        view.addSubview(collectionView)
        
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCell
        let card = cards[indexPath.item]
        cell.configure(with: card)
        return cell
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 40, height: 200)
    }
}
