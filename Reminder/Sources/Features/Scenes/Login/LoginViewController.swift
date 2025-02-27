//
//  LoginViewController.swift
//  Reminder
//
//  Created by Thiago Firsen on 05/02/25.
//

import UIKit

class LoginViewController: UIViewController {
    
    let contentView: LoginView
    let viewModel: LoginViewModel
    var handleAreaHeight: CGFloat = 50.0
    public weak var flowDelegate: LoginFlowDelegate?
    
    init(contentView: LoginView, viewModel: LoginViewModel, flowDelegate: LoginFlowDelegate) {
        self.contentView = contentView
        self.viewModel = viewModel
        self.flowDelegate = flowDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
    
    private func presentSaveLoginAlert(email: String) {
        let alertController = UIAlertController(title: "Salvar acesso",
                                                message: "Deseja salvar seu acesso?",
                                                preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Sim", style: .default) { [weak self] _ in
            let user = User(email: email, isUserSaved: true)
            UserDefaultsManager.saveUser(user: user)
            self?.flowDelegate?.navigateToHome()
        }
        
        let cancelAction = UIAlertAction(title: "Não", style: .cancel) { [weak self] _ in
            self?.flowDelegate?.navigateToHome()
        }
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true)
    }
    
    private func presentErrorAlert(message: String) {
        let alertController = UIAlertController(title: "Erro ao executar login",
                                                message: message,
                                                preferredStyle: .alert)
        
        let retryAction = UIAlertAction(title: "Fechar", style: .default)
        
        alertController.addAction(retryAction)
        
        self.present(alertController, animated: true)
    }
}

extension LoginViewController: LoginViewDelegate {
    func sendLoginData(email: String, password: String) {
        viewModel.doAuth(email: email, password: password) { [weak self] errorMessage in
            self?.presentErrorAlert(message: "Erro ao tentar realizar login, verifique as credenciais digitadas")
        } handleSuccess: { _ in
            self.presentSaveLoginAlert(email: email)
        }
    }
}
