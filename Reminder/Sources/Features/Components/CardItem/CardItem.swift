//
//  CardItem.swift
//  Reminder
//
//  Created by Thiago Firsen on 07/03/25.
//

import UIKit

class CardItem: UIView {
    
    private let iconView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.gray600
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Typography.subHeading
        label.textColor = Colors.gray100
        label.numberOfLines = 0
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Typography.body
        label.textColor = Colors.gray200
        label.numberOfLines = 0
        return label
    }()
    
    private let arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    init(icon: UIImage?, title: String, description: String) {
        super.init(frame: .zero)
        iconImageView.image = icon
        titleLabel.text = title
        descriptionLabel.text = description
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = Colors.gray700
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 112).isActive = true
        addSubview(iconView)
        iconView.addSubview(iconImageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(arrowImageView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            iconView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.small),
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.widthAnchor.constraint(equalToConstant: 80),
            iconView.heightAnchor.constraint(equalToConstant: 80),
            
            iconImageView.centerXAnchor.constraint(equalTo: iconView.centerXAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: iconView.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 48),
            iconImageView.heightAnchor.constraint(equalToConstant: 48),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Metrics.medium),
            titleLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: Metrics.medier),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.medier),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.tiny),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: Metrics.medier),
            
            arrowImageView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            arrowImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.medier),
            arrowImageView.widthAnchor.constraint(equalToConstant: 16),
            arrowImageView.heightAnchor.constraint(equalToConstant: 16)
        ])
    }
}
