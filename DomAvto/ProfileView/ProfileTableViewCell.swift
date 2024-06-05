//
//  ProfileTableViewCell.swift
//  DomAvto
//
//  Created by Ильмир Шарафутдинов on 01.05.2024.
//
import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    private var configure: ((UIImagePickerController) -> ())?
    lazy var dataManager = CoreDataManager.shared
    
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
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 35
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLayout()
        addPhotoInProfile()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureCell(name: String, image: String, email: String, avatarImage: Data?, configure: ((UIImagePickerController) -> ())? = nil) {
        nameLabel.text = name
        emailLabel.text = email
        if let avatarImage = avatarImage {
            avatarImageView.image = UIImage(data: avatarImage)
        } else {
            avatarImageView.image = UIImage(named: "black")
        }
        self.configure = configure
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
    
    
    func addPhotoInProfile() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(addNewPostImageAction))

        avatarImageView.isUserInteractionEnabled = true
        avatarImageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc
    func addNewPostImageAction() {
        let vc = UIImagePickerController ()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        configure?(vc)
    }
    
}


extension UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension ProfileTableViewCell: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey (rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            avatarImageView.image = image
            
            let users = dataManager.obtainSavedData()
            for user in users {
                if user.name == UserDefaults.standard.string(forKey: "currentUser") {
                    user.avatarImageView = image.pngData()
                }
            }
            dataManager.saveContext()
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
