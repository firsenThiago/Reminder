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
        navigationController?.setNavigationBarHidden(true, animated: false)
        return navigationController
    }
}

extension ReminderFlowController: LoginFlowDelegate {
    func navigateToHome() {
        self.navigationController?.dismiss(animated: false)
        let viewController = viewControllerFactory.makeHomeViewController(flowDelegate: self)
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
        let viewController = viewControllerFactory.makeHomeViewController(flowDelegate: self)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

extension ReminderFlowController: HomeFlowDelegate {
    func logout() {
        self.navigationController?.popViewController(animated: true)
        self.openLoginBottomSheet()
    }
    
    func goToNewReceipt() {
        let viewController = viewControllerFactory.makeNewReceiptViewController(flowDelegate: self)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func gotoMyReceipts() {
        let viewController = viewControllerFactory.makeMyReceiptsView(flowDelegate: self)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

extension ReminderFlowController: NewReceiptFlowDelegate {
    
}

extension ReminderFlowController: MyReceiptsFlowDelegate {
    func navigateToNewReceipt() {
        let viewController = viewControllerFactory.makeNewReceiptViewController(flowDelegate: self)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
