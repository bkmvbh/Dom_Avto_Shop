//
//  DetailCollectionView.swift
//  DomAvto
//
//  Created by Ильмир Шарафутдинов on 28.04.2024.
//

import UIKit

class DetailCollectionView: UIView {
    
    lazy var collectiionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(DetailCollectionViewCell.self, forCellWithReuseIdentifier: "DetailCollectionViewCell")

        return collection
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        setupLayouts()
        setupConstraints()
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    private func setupSubviews() {
        addSubview(collectiionView)
    }
    
    private func setupLayouts() {
        backgroundColor = .white
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectiionView.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            collectiionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectiionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectiionView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
