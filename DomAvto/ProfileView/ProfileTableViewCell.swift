//
//  ProfileTableViewCell.swift
//  DomAvto
//
//  Created by Ильмир Шарафутдинов on 01.05.2024.
//
import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 16/255, green: 12/255, blue: 232/255, alpha: 1)
        
        return label
    }()
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 35
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureCell(name: String, image: String, email: String) {
        nameLabel.text = name
        avatarImageView.image = UIImage(named: "black")
        emailLabel.text = email
    }
        
    func setupLayout() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(avatarImageView)
        contentView.addSubview(emailLabel)
        
        NSLayoutConstraint.activate([
            avatarImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
//            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            avatarImageView.heightAnchor.constraint(equalToConstant: 70),
            avatarImageView.widthAnchor.constraint(equalToConstant: 70),
            
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 15),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 15),
            emailLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 15)
        ])
    }
    
    
}


extension UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
