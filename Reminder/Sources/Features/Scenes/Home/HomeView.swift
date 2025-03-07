//
//  HomeView.swift
//  Reminder
//
//  Created by Thiago Firsen on 26/02/25.
//

import UIKit

class HomeView: UIView {
    
    weak public var delegate: HomeViewDelegate?
    
    let profileBackground: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.gray600
        return view
    }()
    
    let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = Metrics.medium
        imageView.layer.borderColor = Colors.primaryBlueBase.cgColor
        imageView.layer.borderWidth = 1
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    let contentBackground: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 30
        view.layer.masksToBounds = true
        view.backgroundColor = Colors.gray800
        return view
    }()
    
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Typography.label
        label.textColor = Colors.gray200
        label.text = Text.homeWelcomeLabel
        return label
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = Typography.heading
        textField.textColor = Colors.gray100
        textField.placeholder = "Insira seu nome"
        textField.returnKeyType = .done
        return textField
    }()
    
    let myPrescriptionCardItem: CardItem = {
        let cardItem = CardItem(icon: UIImage(named: "paper"),
                                title: "Minhas receitas",
                                description: "Acompanhe os medicamentos e gerencie lembretes")
        cardItem.translatesAutoresizingMaskIntoConstraints = false
        return cardItem
    }()
    
    let newPrescriptionCardItem: CardItem = {
        let cardItem = CardItem(icon: UIImage(named: "pills"),
                                title: "Nova receita",
                                description: "Cadastre novos lembretes de receitas")
        cardItem.translatesAutoresizingMaskIntoConstraints = false
        return cardItem
    }()
    
    let feedbackButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = Metrics.medium
        button.tintColor = Colors.gray800
        button.setTitle(Text.homeFeedbackButtonTitle, for: .normal)
        button.titleLabel?.font = Typography.subHeading
        button.backgroundColor = Colors.gray100
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.backgroundColor = Colors.gray600
        addSubview(profileBackground)
        addSubview(profileImage)
        addSubview(welcomeLabel)
        addSubview(nameTextField)
        addSubview(contentBackground)
        addSubview(myPrescriptionCardItem)
        addSubview(newPrescriptionCardItem)
        addSubview(feedbackButton)

        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            profileBackground.topAnchor.constraint(equalTo: topAnchor),
            profileBackground.leadingAnchor.constraint(equalTo: leadingAnchor),
            profileBackground.trailingAnchor.constraint(equalTo: trailingAnchor),
            profileBackground.heightAnchor.constraint(equalToConstant: 200),
            
            profileImage.topAnchor.constraint(equalTo: profileBackground.safeAreaLayoutGuide.topAnchor, constant: 32),
            profileImage.leadingAnchor.constraint(equalTo: profileBackground.leadingAnchor, constant: 32),
            profileImage.heightAnchor.constraint(equalToConstant: 64),
            profileImage.widthAnchor.constraint(equalToConstant: 64),
            
            welcomeLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 16),
            welcomeLabel.leadingAnchor.constraint(equalTo: profileImage.leadingAnchor),
            
            nameTextField.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 4),
            nameTextField.leadingAnchor.constraint(equalTo: profileImage.leadingAnchor),
            
            contentBackground.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 32),
            contentBackground.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentBackground.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentBackground.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            myPrescriptionCardItem.topAnchor.constraint(equalTo: contentBackground.topAnchor, constant: Metrics.extraLarge),
            myPrescriptionCardItem.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.high),
            myPrescriptionCardItem.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.high),
            
            newPrescriptionCardItem.topAnchor.constraint(equalTo: myPrescriptionCardItem.bottomAnchor, constant: Metrics.medier),
            newPrescriptionCardItem.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.high),
            newPrescriptionCardItem.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.high),
            
            feedbackButton.bottomAnchor.constraint(equalTo: contentBackground.safeAreaLayoutGuide.bottomAnchor, constant: -14),
            feedbackButton.leadingAnchor.constraint(equalTo: contentBackground.leadingAnchor, constant: 32),
            feedbackButton.trailingAnchor.constraint(equalTo: contentBackground.trailingAnchor, constant: -32),
            feedbackButton.heightAnchor.constraint(equalToConstant: Metrics.buttonSize)
        ])
    }
    
}
