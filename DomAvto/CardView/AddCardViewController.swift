//
//  AddCardViewController.swift
//  DomAvto
//
//  Created by Ильмир Шарафутдинов on 04.06.2024.
//

import UIKit

class AddCardViewController: UIViewController {

    var successClosure: ((Card) -> Void)? = nil
    
    let cardNumberTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Card Number"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        return textField
    }()

    let expiryDateTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "MM/YY"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        return textField
    }()

    let cvvTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "CVV"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        return textField
    }()

    let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add Card", for: .normal)
        button.addTarget(self, action: #selector(addCardTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    
    private func setupUI() {
        view.backgroundColor = .white
        
        
        view.addSubview(cardNumberTextField)
        view.addSubview(expiryDateTextField)
        view.addSubview(cvvTextField)
        view.addSubview(addButton)

        
        setConstraints()
    }

    private func setConstraints() {
        cardNumberTextField.translatesAutoresizingMaskIntoConstraints = false
        expiryDateTextField.translatesAutoresizingMaskIntoConstraints = false
        cvvTextField.translatesAutoresizingMaskIntoConstraints = false
        addButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            cardNumberTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            cardNumberTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cardNumberTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            expiryDateTextField.topAnchor.constraint(equalTo: cardNumberTextField.bottomAnchor, constant: 20),
            expiryDateTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            expiryDateTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            cvvTextField.topAnchor.constraint(equalTo: expiryDateTextField.bottomAnchor, constant: 20),
            cvvTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cvvTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            addButton.topAnchor.constraint(equalTo: cvvTextField.bottomAnchor, constant: 20),
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    @objc private func addCardTapped() {
        guard let cardNumber = cardNumberTextField.text, !cardNumber.isEmpty,
              let expiryDate = expiryDateTextField.text, !expiryDate.isEmpty,
              let cvv = cvvTextField.text, !cvv.isEmpty else {
            let alert = UIAlertController(title: "Ошибка", message: "Пожалуйста заполните все поля", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        
        let successAlert = UIAlertController(title: "Успех", message: "Карта успешно добавлена!", preferredStyle: .alert)
        successAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak self] _ in
            self?.successClosure?(Card(cardNumber: cardNumber, expiryDate: expiryDate, cvv: cvv))
            self?.navigationController?.popViewController(animated: true)
        }))
        present(successAlert, animated: true, completion: nil)
    }
}
