//
//  ViewsFactoryProtocol.swift
//  Reminder
//
//  Created by Thiago Firsen on 15/02/25.
//

protocol ViewsFactoryProtocol: AnyObject {
    func makeLoginView() -> LoginView
    func makeSplashView() -> SplashView
    func makeHomeView() -> HomeView
    func makeNewReceiptView() -> NewReceiptView
}
