//
//  MyReceiptsView.swift
//  Reminder
//
//  Created by Thiago Firsen on 19/03/25.
//

import UIKit

class MyReceiptsView: UIView {
    
    let headerBackground: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.gray600
        return view
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        button.tintColor = Colors.gray100
        return button
    }()
    
    let addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "add-button"), for: .normal)
        button.tintColor = Colors.primaryBlueBase
        return button
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Typography.heading
        label.textColor = Colors.primaryBlueBase
        label.text = "Minhas receitas"
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Typography.body
        label.textColor = Colors.gray200
        label.text = "Acompanhe seus medicamentos cadastrados e gerencie lembretes"
        label.numberOfLines = 0
        return label
    }()
    
    let contentBackground: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 30
        view.layer.masksToBounds = true
        view.backgroundColor = Colors.gray800
        return view
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
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
        addSubview(headerBackground)
        addSubview(backButton)
        addSubview(addButton)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(contentBackground)
        contentBackground.addSubview(tableView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            headerBackground.topAnchor.constraint(equalTo: topAnchor),
            headerBackground.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerBackground.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerBackground.heightAnchor.constraint(equalToConstant: 200),
            
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Metrics.high),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.high),
            backButton.heightAnchor.constraint(equalToConstant: 24),
            backButton.widthAnchor.constraint(equalToConstant: 24),
            
            addButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Metrics.high),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.high),
            addButton.heightAnchor.constraint(equalToConstant: 40),
            addButton.widthAnchor.constraint(equalToConstant: 40),
            
            titleLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: Metrics.medium),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.high),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.high),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.tiny),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.high),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.high),
            
            contentBackground.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 32),
            contentBackground.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentBackground.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentBackground.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            tableView.topAnchor.constraint(equalTo: contentBackground.topAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: contentBackground.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: contentBackground.trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: contentBackground.bottomAnchor, constant: -16),
        ])
    }
}
