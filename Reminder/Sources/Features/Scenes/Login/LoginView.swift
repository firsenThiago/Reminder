//
//  LoginView.swift
//  Reminder
//
//  Created by Thiago Firsen on 05/02/25.
//

import UIKit

class LoginView: UIView {
    public weak var delegate: LoginViewDelegate?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = Text.loginWelcomeTitle
        label.font = Typography.subHeading
        label.textColor = Colors.gray100
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailTextLabel: UILabel = {
        let label = UILabel()
        label.text = Text.loginEmailLabel
        label.font = Typography.label
        label.textColor = Colors.gray100
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = Text.loginEmailPlaceholder
        textField.borderStyle = .roundedRect
        textField.textColor = Colors.gray200
        textField.font = Typography.input
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let passwordTextLabel: UILabel = {
        let label = UILabel()
        label.text = Text.loginPasswordLabel
        label.font = Typography.label
        label.textColor = Colors.gray100
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = Text.loginPasswordPlaceholder
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.textColor = Colors.gray200
        textField.font = Typography.input
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Text.LoginButtonTitle, for: .normal)
        button.backgroundColor = Colors.primaryRedBase
        button.layer.cornerRadius = Metrics.medium
        button.addTarget(self, action: #selector(didTapped), for: .touchUpInside)
        button.titleLabel?.font = Typography.subHeading
        button.tintColor = Colors.gray800
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = .white
        self.layer.cornerRadius = Metrics.small
        self.addSubview(titleLabel)
        self.addSubview(emailTextLabel)
        self.addSubview(emailTextField)
        self.addSubview(passwordTextLabel)
        self.addSubview(passwordTextField)
        self.addSubview(loginButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Metrics.huge),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            
            emailTextLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.extraLarge),
            emailTextLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            
            emailTextField.topAnchor.constraint(equalTo: emailTextLabel.bottomAnchor, constant: Metrics.small),
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
            emailTextField.heightAnchor.constraint(equalToConstant: Metrics.inputSize),
            
            passwordTextLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: Metrics.medium),
            passwordTextLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordTextLabel.bottomAnchor, constant: Metrics.small),
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
            passwordTextField.heightAnchor.constraint(equalToConstant: Metrics.inputSize),
            
            loginButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -Metrics.medium),
            loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
            loginButton.heightAnchor.constraint(equalToConstant: Metrics.buttonSize)
            
        ])
    }
    
    @objc
    private func didTapped() {
        let password = passwordTextField.text ?? ""
        let email = emailTextField.text ?? ""
        delegate?.sendLoginData(email: email, password: password)
    }
}
