//
//  UIViewController+Extensions.swift
//  Reminder
//
//  Created by Thiago Firsen on 26/02/25.
//

import UIKit

extension UIViewController {
    func setupContentViewToBounds(contentView: UIView) {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
