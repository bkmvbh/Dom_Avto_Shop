//
//  CollectionViewCell.swift
//  DomAvto
//
//  Created by Ильмир Шарафутдинов on 16.04.2024.
//

import UIKit

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    lazy var goodsNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont(name: "Roboto", size: 12)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var cellPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        self.backgroundColor = .clear
        
        contentView.addSubview(cellPhotoImageView)
        contentView.addSubview(goodsNameLabel)
        
        NSLayoutConstraint.activate([
            goodsNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            goodsNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            goodsNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            cellPhotoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellPhotoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cellPhotoImageView.topAnchor.constraint(equalTo: goodsNameLabel.bottomAnchor),
            cellPhotoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])

        contentView.layer.borderWidth = 1.3
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.layer.cornerRadius = 20

    }
}
