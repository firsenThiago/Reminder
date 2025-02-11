//
//  SplashViewController.swift
//  Reminder
//
//  Created by Thiago Firsen on 03/02/25.
//

import UIKit

class SplashViewController: UIViewController {
    
    let contentView = SplashView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupGesture()
    }
    
    private func setup() {
        self.view.addSubview(contentView)
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = Colors.primaryRedBase
        setupConstraints()
    }
    
    private func setupConstraints() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @objc
    private func showLogin() {
        let loginViewController = LoginViewController()
        loginViewController.modalPresentationStyle = .overCurrentContext
        loginViewController.modalTransitionStyle = .crossDissolve
        loginViewController.mainNavigation = self.navigationController
        self.present(loginViewController, animated: false) {
            loginViewController.animateShow()
        }
    }
    
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showLogin))
        self.view.addGestureRecognizer(tapGesture)
    }
}
