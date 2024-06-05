//
//  DetailCollectionViewCell.swift
//  DomAvto
//
//  Created by Ильмир Шарафутдинов on 28.04.2024.
//

import UIKit

class DetailCollectionViewCell: UICollectionViewCell {
    
    lazy var cellPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
     lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Такаяма"
        return label
    }()
    
     lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "1400 ₽"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
     lazy var pastPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "2000 ₽"
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 18)
        
        let attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue
        ]
        
        label.attributedText = NSAttributedString(string: label.text ?? "",
                                                 attributes: attributes)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
     lazy var descriptionGoodsLabel: UILabel = {
        let label = UILabel()
        label.text = "масло жаропрочное там тут"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var reviewButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "review"), for: .normal)
        return button
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
        contentView.addSubview(nameLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(pastPriceLabel)
        contentView.addSubview(descriptionGoodsLabel)
        contentView.addSubview(reviewButton)
        
        NSLayoutConstraint.activate([
            cellPhotoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
            cellPhotoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -6),
            cellPhotoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellPhotoImageView.bottomAnchor.constraint(equalTo: priceLabel.topAnchor, constant: -4),
            cellPhotoImageView.heightAnchor.constraint(equalToConstant: 250),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            priceLabel.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -4),
            pastPriceLabel.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 8),
            pastPriceLabel.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -4),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            nameLabel.bottomAnchor.constraint(equalTo: descriptionGoodsLabel.topAnchor, constant: -4),
            descriptionGoodsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            descriptionGoodsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            descriptionGoodsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            reviewButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            reviewButton.topAnchor.constraint(equalTo: descriptionGoodsLabel.bottomAnchor, constant: 4),
            reviewButton.heightAnchor.constraint(equalToConstant: 25),
            reviewButton.widthAnchor.constraint(equalToConstant: 130)
        ])
        
        cellPhotoImageView.layer.borderWidth = 1.3
        cellPhotoImageView.layer.borderColor = UIColor.lightGray.cgColor
        cellPhotoImageView.layer.cornerRadius = 20

    }
}
