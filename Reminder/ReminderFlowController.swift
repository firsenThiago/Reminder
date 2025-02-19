//
//  ReminderFlowController.swift
//  Reminder
//
//  Created by Thiago Firsen on 13/02/25.
//

import UIKit

class ReminderFlowController {
    private var navigationController: UINavigationController?
    private let viewControllerFactory: ViewControllersFactoryProtocol
    
    init(viewControllerFactory: ViewControllersFactoryProtocol) {
        self.viewControllerFactory = viewControllerFactory
    }
    
    //MARK: - startFlow
    func start() -> UINavigationController? {
        let startViewController = viewControllerFactory.makeSplashViewController(flowDelegate: self)
        self.navigationController = UINavigationController(rootViewController: startViewController)
        return navigationController
    }
}

extension ReminderFlowController: LoginFlowDelegate {
    func navigateToHome() {
        self.navigationController?.dismiss(animated: false)
        let viewController = UIViewController()
        viewController.view.backgroundColor = .systemBlue
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

extension ReminderFlowController: SplashFlowDelegate {
    func openLoginBottomSheet() {
        let loginViewController = viewControllerFactory.makeLoginViewController(flowDelegate: self)
        loginViewController.modalPresentationStyle = .overCurrentContext
        loginViewController.modalTransitionStyle = .crossDissolve
        navigationController?.present(loginViewController, animated: false) {
            loginViewController.animateShow()
        }
    }
    
    func goToHome() {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .systemBlue
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
