//
//  NewReceiptView.swift
//  Reminder
//
//  Created by Thiago Firsen on 07/03/25.
//

import UIKit

class NewReceiptView: UIView {
    
    let backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        button.tintColor = Colors.gray100
        return button
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Typography.heading
        label.textColor = Colors.primaryRedBase
        label.text = "Nova receita"
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Typography.body
        label.textColor = Colors.gray200
        label.text = "Adicione a sua prescrição médica para receber lembretes de quando tomar seu medicamento"
        label.numberOfLines = 0
        return label
    }()
    
    let addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("+ Adicionar", for: .normal)
        button.titleLabel?.font = Typography.subHeading
        button.backgroundColor = Colors.primaryRedBase
        button.layer.cornerRadius = Metrics.medium
        button.setTitleColor(Colors.gray800, for: .normal)
        return button
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let remedyInput = Input(title: "Remedio", placeHolder: "Nome do medicamento")
    let timeInput = Input(title: "Horário", placeHolder: "12:00")
    let recurrenceInput = Input(title: "Recorrência", placeHolder: "Selecione")
    let takeNowCheckBox = CheckBox(title: "Tomar agora")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(backButton)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(stackView)
        stackView.addArrangedSubview(remedyInput)
        stackView.addArrangedSubview(timeInput)
        stackView.addArrangedSubview(recurrenceInput)
        stackView.addArrangedSubview(takeNowCheckBox)
        addSubview(addButton)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Metrics.high),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.high),
            backButton.heightAnchor.constraint(equalToConstant: 24),
            backButton.widthAnchor.constraint(equalToConstant: 24),
            
            titleLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: Metrics.medium),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.high),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.high),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.tiny),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.high),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.high),
            
            stackView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: Metrics.extraLarge),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.high),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.high),
            
            addButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.high),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.high),
            addButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -Metrics.small),
            addButton.heightAnchor.constraint(equalToConstant: Metrics.buttonSize)
        ])
    }
}
