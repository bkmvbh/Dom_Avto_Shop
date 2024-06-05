//
//  GoodsViewController.swift
//  DomAvto
//
//  Created by Ильмир Шарафутдинов on 28.04.2024.
//


import UIKit

class GoodsViewController: UIViewController {
    
    var goodId = ""
    
    lazy var cellPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "1400 ₽"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Моторное масло Mobil Super 3000 5W-40, 4 л"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    lazy var discriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    lazy var pastPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "2000 ₽"
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 20)
        
        let attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue
        ]
        
        label.attributedText = NSAttributedString(string: label.text ?? "", attributes: attributes)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var reviewButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "review"), for: .normal)
        return button
    }()
    
    lazy var reviewCountLabel: UILabel = {
        let label = UILabel()
        label.text = "1356"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        return label
    }()
    
    lazy var toOrderGoodsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 16/255, green: 12/255, blue: 232/255, alpha: 1)
        button.layer.cornerRadius = 18
        button.addTarget(self, action: #selector(addToCart), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        view.backgroundColor = .white
    }
    
    func setupLayout() {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(cellPhotoImageView)
        contentView.addSubview(priceLabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(pastPriceLabel)
        contentView.addSubview(reviewButton)
        contentView.addSubview(reviewCountLabel)
        contentView.addSubview(toOrderGoodsButton)
        contentView.addSubview(discriptionLabel)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            cellPhotoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellPhotoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cellPhotoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            cellPhotoImageView.heightAnchor.constraint(equalToConstant: 300),
            
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            nameLabel.topAnchor.constraint(equalTo: cellPhotoImageView.bottomAnchor, constant: 10),
            
            priceLabel.bottomAnchor.constraint(equalTo: pastPriceLabel.topAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
            pastPriceLabel.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            pastPriceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
            reviewButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            reviewButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            reviewButton.heightAnchor.constraint(equalToConstant: 25),
            reviewButton.widthAnchor.constraint(equalToConstant: 130),
            
            reviewCountLabel.leadingAnchor.constraint(equalTo: reviewButton.trailingAnchor, constant: 5),
            reviewCountLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 15),
            
            toOrderGoodsButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            toOrderGoodsButton.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -17),
            toOrderGoodsButton.widthAnchor.constraint(equalToConstant: 116),
            toOrderGoodsButton.heightAnchor.constraint(equalToConstant: 36),
            
            discriptionLabel.topAnchor.constraint(equalTo: reviewCountLabel.bottomAnchor, constant: 10),
            discriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            discriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            discriptionLabel.bottomAnchor.constraint(equalTo: priceLabel.topAnchor, constant: -10)
        ])
        
        if DataBaseManager.shared.shoppingCart.contains(goodId) == true {
            toOrderGoodsButton.backgroundColor = .gray
            toOrderGoodsButton.setTitle("Удалить", for: .selected)
            toOrderGoodsButton.isSelected = true
        } else {
            toOrderGoodsButton.backgroundColor = UIColor(red: 16/255, green: 12/255, blue: 232/255, alpha: 1)
            toOrderGoodsButton.setTitle("В корзину", for: .normal)
            toOrderGoodsButton.isSelected = false
        }
    }
    
    @objc
    func addToCart() {
        toOrderGoodsButton.isSelected.toggle()
        if toOrderGoodsButton.isSelected {
            DataBaseManager.shared.addGoodToCart(by: goodId)
            toOrderGoodsButton.backgroundColor = .gray
            toOrderGoodsButton.setTitle("Удалить", for: .selected)
        } else {
            DataBaseManager.shared.removeGood(at: goodId)
            toOrderGoodsButton.backgroundColor = UIColor(red: 16/255, green: 12/255, blue: 232/255, alpha: 1)
            toOrderGoodsButton.setTitle("В корзину", for: .normal)
        }
    }
}

