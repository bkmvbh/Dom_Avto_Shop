//
//  CollectionView.swift
//  DomAvto
//
//  Created by Ильмир Шарафутдинов on 16.04.2024.
//

import UIKit

class MyCollectionView: UIView {
    
    lazy var openMapsButton: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "location"), for: .normal)
        button.setTitle("Казань, Пушкина 5", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        button.layer.cornerRadius = 22
        button.layer.borderWidth = 1.0
        button.layer.borderColor = CGColor(red: 16/255, green: 12/255, blue: 232/255, alpha: 1)
        return button
    }()

    
    lazy var collectiionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "cell")

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
        addSubview(openMapsButton)
    }
    
    private func setupLayouts() {
        backgroundColor = .white
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            openMapsButton.topAnchor.constraint(equalTo: topAnchor, constant: 130),
            openMapsButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            openMapsButton.widthAnchor.constraint(equalToConstant: 200),
            openMapsButton.heightAnchor.constraint(equalToConstant: 45),
            collectiionView.topAnchor.constraint(equalTo: openMapsButton.bottomAnchor, constant: 50),
            collectiionView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 8),
            collectiionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectiionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
    }
}


