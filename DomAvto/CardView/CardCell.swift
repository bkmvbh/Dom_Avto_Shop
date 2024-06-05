//
//  CardCell.swift
//  DomAvto
//
//  Created by Ильмир Шарафутдинов on 04.06.2024.
//

import UIKit

class CardCell: UICollectionViewCell {
    
    let cardNumberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    let expiryDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        backgroundColor = .systemGreen
        layer.cornerRadius = 10
        layer.masksToBounds = true
        
        addSubview(cardNumberLabel)
        addSubview(expiryDateLabel)
        
        cardNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        expiryDateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cardNumberLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            cardNumberLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -10),
            
            expiryDateLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            expiryDateLabel.topAnchor.constraint(equalTo: cardNumberLabel.bottomAnchor, constant: 10)
        ])
    }
    
    func configure(with card: Card) {
        cardNumberLabel.text = card.cardNumber
        expiryDateLabel.text = "Expires \(card.expiryDate)"
    }
}
