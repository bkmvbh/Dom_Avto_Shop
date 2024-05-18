//
//  GoodsViewController.swift
//  DomAvto
//
//  Created by Ильмир Шарафутдинов on 28.04.2024.
//

import UIKit

class GoodsViewController: UIViewController {
    
    var imageName = ""
    
    lazy var cellPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "1400 ₽"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var discriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Моторное масло Mobil Super 3000 5W-40, 4 л"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var pastPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "2000 ₽"
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 20)
        
        let attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue
        ]
        
        label.attributedText = NSAttributedString(string: label.text ?? "",
                                                 attributes: attributes)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var reviewButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "review"), for: .normal)
        return button
    }()
    
    private lazy var reviewCountLabel: UILabel = {
        let label = UILabel()
        label.text = "1356"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        return label
    }()
    
    private lazy var toOrderGoodsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 16/255, green: 12/255, blue: 232/255, alpha: 1)
        button.layer.cornerRadius = 18
        button.setTitle("В корзину", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        view.backgroundColor = .white
    }
    
    func setupLayout() {
        
        view.addSubview(cellPhotoImageView)
        view.addSubview(priceLabel)
        view.addSubview(discriptionLabel)
        view.addSubview(pastPriceLabel)
        view.addSubview(reviewButton)
        view.addSubview(reviewCountLabel)
        view.addSubview(toOrderGoodsButton)
        
        NSLayoutConstraint.activate([
            cellPhotoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cellPhotoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            cellPhotoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(100)),
            cellPhotoImageView.heightAnchor.constraint(equalToConstant: 300),
            discriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            discriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            discriptionLabel.topAnchor.constraint(equalTo: cellPhotoImageView.bottomAnchor, constant: 10),
            priceLabel.bottomAnchor.constraint(equalTo: pastPriceLabel.topAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            pastPriceLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            pastPriceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            reviewButton.topAnchor.constraint(equalTo: discriptionLabel.bottomAnchor, constant: 10),
            reviewButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            reviewButton.heightAnchor.constraint(equalToConstant: 25),
            reviewButton.widthAnchor.constraint(equalToConstant: 130),
            reviewCountLabel.leadingAnchor.constraint(equalTo: reviewButton.trailingAnchor, constant: 5),
            reviewCountLabel.topAnchor.constraint(equalTo: discriptionLabel.bottomAnchor, constant: 15),
            toOrderGoodsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            toOrderGoodsButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -17),
            toOrderGoodsButton.widthAnchor.constraint(equalToConstant: 116),
            toOrderGoodsButton.heightAnchor.constraint(equalToConstant: 36)
        ])
        cellPhotoImageView.image = UIImage(named: imageName)
    }
}
