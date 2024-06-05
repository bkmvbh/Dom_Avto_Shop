//
//  SupportViewController.swift
//  DomAvto
//
//  Created by Ильмир Шарафутдинов on 05.06.2024.
//

import UIKit

class SupportViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Поддержка"
        
        let titleLabel = UILabel()
        titleLabel.text = "Связаться с поддержкой"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(titleLabel)
        
        
        let buttonsStackView = UIStackView()
        buttonsStackView.axis = .vertical
        buttonsStackView.alignment = .fill
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.spacing = 36
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(buttonsStackView)
        
        
        let vkButton = createButton(title: "  ВКонтакте", imageName: "vk")
        vkButton.addTarget(self, action: #selector(vkButtonTapped), for: .touchUpInside)
        
        
        let telegramButton = createButton(title: "  Телеграм", imageName: "telegram")
        telegramButton.addTarget(self, action: #selector(telegramButtonTapped), for: .touchUpInside)
        
        
        let instagramButton = createButton(title: "  Инстаграм", imageName: "instagram")
        instagramButton.addTarget(self, action: #selector(instagramButtonTapped), for: .touchUpInside)
        
        
        [vkButton, telegramButton, instagramButton].forEach { buttonsStackView.addArrangedSubview($0) }
        
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        
        NSLayoutConstraint.activate([
            buttonsStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            buttonsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    
    private func createButton(title: String, imageName: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.black, for: .normal)
        
        
        if let image = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal).resize(targetSize: CGSize(width: 30, height: 30)) {
            button.setImage(image, for: .normal)
        }
        
        button.contentHorizontalAlignment = .left
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    
    @objc private func vkButtonTapped() {
        
        if let url = URL(string: "https://vk.com/b.o.o.m.b.a.stic/") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @objc private func telegramButtonTapped() {
        
        if let url = URL(string: "https://t.me/b_o_o_m_b_a_s") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @objc private func instagramButtonTapped() {
        
        if let url = URL(string: "https://www.instagram.com/b.o.o.m.b.a.s.t.i.c/") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

extension UIImage {
    func resize(targetSize: CGSize) -> UIImage {
        let size = self.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        var newSize: CGSize
        if widthRatio > heightRatio {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }
        
        let rect = CGRect(origin: .zero, size: newSize)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        self.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage ?? UIImage()
    }
}
