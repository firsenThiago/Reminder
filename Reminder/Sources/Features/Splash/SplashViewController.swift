//
//  SplashViewController.swift
//  Reminder
//
//  Created by Thiago Firsen on 03/02/25.
//

import UIKit

class SplashViewController: UIViewController {
    
    let contentView: SplashView
    public weak var flowDelegate: SplashFlowDelegate?
    
    init(contentView: SplashView, flowDelegate: SplashFlowDelegate) {
        self.contentView = contentView
        self.flowDelegate = flowDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        startBreathingAnimation()
        setupGesture()
    }
    
    private func decideNavigationFlow() {
        if let user = UserDefaultsManager.loadUser() {
            if user.isUserSaved {
                flowDelegate?.goToHome()
            } else {
                showLogin()
            }
        }
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
        self.animateLogoUp()
        self.flowDelegate?.openLoginBottomSheet()
    }
    
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showLogin))
        self.view.addGestureRecognizer(tapGesture)
    }
}

// MARK: - Animations
extension SplashViewController {
    private func startBreathingAnimation() {
        UIView.animate(withDuration: 1.5, delay: 0, animations: {
            self.contentView.logoImageView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }, completion: { _ in
            self.decideNavigationFlow()
        })
    }
    
    private func animateLogoUp() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.contentView.logoImageView.transform = self.contentView.logoImageView.transform.translatedBy(x: 0, y: -100)
        })
    }
}
