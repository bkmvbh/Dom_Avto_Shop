//
//  LoginView.swift
//  DomAvto
//
//  Created by Ильмир Шарафутдинов on 27.03.2024.
//

import UIKit

protocol LoginViewDelegate: AnyObject {
    func didTapSignUpButton()
    
}

class LoginView: UIView {
    weak var delegate: LoginViewDelegate?
    
    var dataSource: [User] = []
    
    lazy var dataManager = CoreDataManager.shared
    
    let loginAndPasswordConstraintsLeadingAndTrailing = 16
    let passwordTopAnchor = 40
    let buttonTopAnchor = 60
    let greetingLabelTopAnchor = 75
    let buttonWidthAnchor = 318
    let buttonHeightAnchor = 45
    let imageWidthHeightAnchor = 170

    
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        //imageView.layer.cornerRadius = CGFloat(imageWidthHeightAnchor/2)
        return imageView
    }()
    
    lazy var loginAndRegistrationSegmentedControl: UISegmentedControl = {
        let items = ["Вход", "Регистрация"]
        let control = UISegmentedControl(items: items)
        control.selectedSegmentIndex = 0
        control.tintColor = .blue
        control.translatesAutoresizingMaskIntoConstraints = false
        control.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        
        return control
    }()
    
    lazy var greetingLabel: UILabel = {
        let label = UILabel()
        label.text = "Добро \n Пожаловать"
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var signUpButton: UIButton = {
        
//        let action = UIAction { _ in
//            self.buttonToChangeAction()
//        }
        let button = UIButton()
        button.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        button.setTitle("Войти", for: .normal)
        button.backgroundColor = UIColor(red: 16/255, green: 12/255, blue: 232/255, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var nameTextField: UITextField = {
        let login = UITextField()
        login.translatesAutoresizingMaskIntoConstraints = false
        login.borderStyle = .line
        login.placeholder = "Введите Ваше Имя"
        login.borderStyle = .none
        login.isHidden = true
        
        return login
    }()
    
    lazy var loginTextField: UITextField = {
        let login = UITextField()
        login.translatesAutoresizingMaskIntoConstraints = false
        login.borderStyle = .line
        login.placeholder = "Логин"
        login.borderStyle = .none
        
        return login
    }()
    
    lazy var passwordTextField: UITextField = {
        let password = UITextField()
        password.translatesAutoresizingMaskIntoConstraints = false
        password.borderStyle = .line
        password.isSecureTextEntry = true
        password.borderStyle = .none
        password.placeholder = "Пароль"
        
        return password
    }()
    
    lazy var returnPasswordTextField: UITextField = {
        let password = UITextField()
        password.translatesAutoresizingMaskIntoConstraints = false
        password.borderStyle = .line
        password.isSecureTextEntry = true
        password.borderStyle = .none
        password.placeholder = "Подтвердите пароль"
        password.isHidden = true
        
        return password
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        addSubview(signUpButton)
        addSubview(loginTextField)
        addSubview(passwordTextField)
        addSubview(greetingLabel)
        addSubview(loginAndRegistrationSegmentedControl)
        addSubview(logoImageView)
        addSubview(nameTextField)
        addSubview(returnPasswordTextField)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            greetingLabel.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat(greetingLabelTopAnchor)),
            greetingLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat(passwordTopAnchor)),
            greetingLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -CGFloat(passwordTopAnchor)),
            
            loginAndRegistrationSegmentedControl.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: CGFloat(Double(greetingLabelTopAnchor))),
            loginAndRegistrationSegmentedControl.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            nameTextField.topAnchor.constraint(equalTo: loginAndRegistrationSegmentedControl.bottomAnchor, constant: CGFloat(passwordTopAnchor)),
            nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat(loginAndPasswordConstraintsLeadingAndTrailing)),
            nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -CGFloat(loginAndPasswordConstraintsLeadingAndTrailing)),
            
            loginTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: CGFloat(passwordTopAnchor)),
            loginTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat(loginAndPasswordConstraintsLeadingAndTrailing)),
            loginTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -CGFloat(loginAndPasswordConstraintsLeadingAndTrailing)),
            
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: CGFloat(passwordTopAnchor)),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat(loginAndPasswordConstraintsLeadingAndTrailing)),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -CGFloat(loginAndPasswordConstraintsLeadingAndTrailing)),
            
            returnPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: CGFloat(passwordTopAnchor)),
            returnPasswordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat(loginAndPasswordConstraintsLeadingAndTrailing)),
            returnPasswordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -CGFloat(loginAndPasswordConstraintsLeadingAndTrailing)),
            
            signUpButton.topAnchor.constraint(equalTo: returnPasswordTextField.bottomAnchor, constant: CGFloat(buttonTopAnchor)),
            signUpButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat(loginAndPasswordConstraintsLeadingAndTrailing)),
            signUpButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -CGFloat(loginAndPasswordConstraintsLeadingAndTrailing)),
            signUpButton.widthAnchor.constraint(equalToConstant: CGFloat(buttonWidthAnchor)),
            signUpButton.heightAnchor.constraint(equalToConstant: CGFloat(buttonHeightAnchor)),
            
            logoImageView.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: CGFloat(loginAndPasswordConstraintsLeadingAndTrailing)),
//            logoImageView.widthAnchor.constraint(equalToConstant: CGFloat(imageWidthHeightAnchor)),
//            logoImageView.heightAnchor.constraint(equalToConstant: CGFloat(imageWidthHeightAnchor)),
           // logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor)
            logoImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            logoImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    @objc func signUpButtonTapped() {
         delegate?.didTapSignUpButton()
     }
    
//    func buttonToChangeAction() {
//        if passwordTextField.text == returnPasswordTextField.text &&
//            nameTextField.text?.replacingOccurrences(of: " ", with: "") != "" &&
//            loginTextField.text?.replacingOccurrences(of: " ", with: "") != "" &&
//            passwordTextField.text?.replacingOccurrences(of: " ", with: "") != "" {
//            for user in dataManager.obtainSavedData() {
//                if user.name == nameTextField.text {
//                    return
//                }
//            }
//            let user = User(context: dataManager.viewContext)
//            user.name = nameTextField.text
//            user.email = loginTextField.text
//            user.password = passwordTextField.text
//            dataSource.append(user)
//            dataManager.saveContext()
//            UserDefaults.standard.set(user.name, forKey: "currentUser")
//            
//        }
//    }
    
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            signUpButton.setTitle("Войти", for: .normal)
            nameTextField.isHidden = true
            returnPasswordTextField.isHidden = true
            loginTextField.placeholder = "Логин"
            passwordTextField.placeholder = "Пароль"
            loginTextField.text = ""
            passwordTextField.text = ""
        } else {
            signUpButton.setTitle("Зарегистрироваться", for: .normal)
            nameTextField.isHidden = false
            returnPasswordTextField.isHidden = false
            loginTextField.placeholder = "Введите Email"
            passwordTextField.placeholder = "Введите пароль"
            nameTextField.text = ""
            loginTextField.text = ""
            passwordTextField.text = ""
            returnPasswordTextField.text = ""
        }
    }
}
