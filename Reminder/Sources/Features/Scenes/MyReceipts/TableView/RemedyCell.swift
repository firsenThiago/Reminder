//
//  RemedyCell.swift
//  Reminder
//
//  Created by Thiago Firsen on 21/03/25.
//

import UIKit

class RemedyCell: UITableViewCell {
    static let identifier = "RemedyCell"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Typography.subHeading
        label.textColor = Colors.gray200
        return label
    }()
    
    private let timeBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.gray500
        view.layer.cornerRadius = 12
        return view
    }()
    
    private let clockIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "clock"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Typography.tag
        label.textColor = Colors.gray100
        return label
    }()
    
    private let recurrenceBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.gray500
        view.layer.cornerRadius = 12
        return view
    }()
    
    private let recurrenceIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "repeat"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let recurrenceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Typography.tag
        label.textColor = Colors.gray100
        return label
    }()
    
    private let trashIconButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "trash")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.backgroundColor = Colors.gray700
        self.layer.masksToBounds = true
        self.layer.cornerRadius = Metrics.medier
        self.layer.borderColor = Colors.gray600.cgColor
        self.layer.borderWidth = 1
       
        contentView.addSubview(titleLabel)
        contentView.addSubview(timeBackgroundView)
        contentView.addSubview(recurrenceBackgroundView)
        contentView.addSubview(trashIconButton)
        
        timeBackgroundView.addSubview(clockIcon)
        timeBackgroundView.addSubview(timeLabel)
        
        recurrenceBackgroundView.addSubview(recurrenceIcon)
        recurrenceBackgroundView.addSubview(recurrenceLabel)
        
        setupConstraint()
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            trashIconButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            trashIconButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            timeBackgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            timeBackgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            timeBackgroundView.heightAnchor.constraint(equalToConstant: 28),

            recurrenceBackgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            recurrenceBackgroundView.leadingAnchor.constraint(equalTo: timeBackgroundView.trailingAnchor, constant: 16),
            recurrenceBackgroundView.heightAnchor.constraint(equalToConstant: 28),
            
            clockIcon.centerYAnchor.constraint(equalTo: timeBackgroundView.centerYAnchor),
            clockIcon.leadingAnchor.constraint(equalTo: timeBackgroundView.leadingAnchor, constant: 8),
            clockIcon.heightAnchor.constraint(equalToConstant: 16),
            clockIcon.widthAnchor.constraint(equalToConstant: 16),
            
            timeLabel.centerYAnchor.constraint(equalTo: timeBackgroundView.centerYAnchor),
            timeLabel.leadingAnchor.constraint(equalTo: clockIcon.trailingAnchor, constant: 8),
            timeLabel.trailingAnchor.constraint(equalTo: timeBackgroundView.trailingAnchor, constant: -8),
            
            recurrenceIcon.centerYAnchor.constraint(equalTo: recurrenceBackgroundView.centerYAnchor),
            recurrenceIcon.leadingAnchor.constraint(equalTo: recurrenceBackgroundView.leadingAnchor, constant: 8),
            recurrenceIcon.heightAnchor.constraint(equalToConstant: 16),
            recurrenceIcon.widthAnchor.constraint(equalToConstant: 16),
            
            recurrenceLabel.centerYAnchor.constraint(equalTo: recurrenceBackgroundView.centerYAnchor),
            recurrenceLabel.leadingAnchor.constraint(equalTo: recurrenceIcon.trailingAnchor, constant: 8),
            recurrenceLabel.trailingAnchor.constraint(equalTo: recurrenceBackgroundView.trailingAnchor, constant: -8),
            
        ])
    }
    
    func configure(title: String, time: String, recurrence: String) {
        titleLabel.text = title
        timeLabel.text = time
        recurrenceLabel.text = recurrence
    }
}
