//
//  ViewsFactory.swift
//  Reminder
//
//  Created by Thiago Firsen on 15/02/25.
//

final class ViewsFactory: ViewsFactoryProtocol {
    func makeLoginView() -> LoginView {
        let view = LoginView()
        return view
    }
    
    func makeSplashView() -> SplashView {
        let view = SplashView()
        return view
    }
    
    func makeHomeView() -> HomeView {
        let view = HomeView()
        return view
    }
    
    func makeNewReceiptView() -> NewReceiptView {
        let view = NewReceiptView()
        return view
    }
}
