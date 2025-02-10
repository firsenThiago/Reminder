//
//  LoginViewController.swift
//  Reminder
//
//  Created by Thiago Firsen on 05/02/25.
//

import UIKit

class LoginViewController: UIViewController {
    
    let contentView = LoginView()
    let viewModel = LoginViewModel()
    var handleAreaHeight: CGFloat = 50.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.delegate = self
        setup()
        setupGesture()
    }
    
    private func setup() {
        self.view.addSubview(contentView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        let heightConstraint = contentView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5).isActive = true
    }
    
    private func setupGesture() {

    }
    
    private func handlePanGesture() {
        
    }
    
    public func animateShow(completion: (() -> Void)? = nil) {
        self.view.layoutIfNeeded()
        contentView.transform = CGAffineTransform(translationX: 0, y: contentView.frame.height)
        UIView.animate(withDuration: 0.3, animations: {
            self.contentView.transform = .identity
            self.contentView.layoutIfNeeded()
        }) { _ in
            completion?()
        }
    }
}

extension LoginViewController: LoginViewDelegate {
    func sendLoginData(user: String, password: String) {
        viewModel.doAuth(username: user, password: password)
    }
}
