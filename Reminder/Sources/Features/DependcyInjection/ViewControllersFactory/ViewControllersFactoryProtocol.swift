//
//  ViewControllersFactoryProtocol.swift
//  Reminder
//
//  Created by Thiago Firsen on 15/02/25.
//

protocol ViewControllersFactoryProtocol: AnyObject {
    func makeSplashViewController(flowDelegate: SplashFlowDelegate) -> SplashViewController
    func makeLoginViewController(flowDelegate: LoginFlowDelegate) -> LoginViewController
    func makeHomeViewController(flowDelegate: HomeFlowDelegate) -> HomeViewController
}
