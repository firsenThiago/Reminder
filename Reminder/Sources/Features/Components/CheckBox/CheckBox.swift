//
//  CheckBox.swift
//  Reminder
//
//  Created by Thiago Firsen on 07/03/25.
//

import UIKit

class CheckBox: UIView {

    private let checkBox: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "square"), for: .normal)
        button.tintColor = Colors.gray400
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Typography.label
        label.textColor = Colors.gray100
        return label
    }()
    
    init(title: String) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = title
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(checkBox)
        addSubview(titleLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 24),
            
            checkBox.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkBox.leadingAnchor.constraint(equalTo: leadingAnchor),
            checkBox.heightAnchor.constraint(equalToConstant: 24),
            checkBox.widthAnchor.constraint(equalToConstant: 24),
            
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: checkBox.trailingAnchor, constant: Metrics.small),
        ])
    }
}
