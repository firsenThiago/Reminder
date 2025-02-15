//
//  ViewControllersFactory.swift
//  Reminder
//
//  Created by Thiago Firsen on 15/02/25.
//

final class ViewControllersFactory: ViewControllersFactoryProtocol {
    private let viewsFactory: ViewsFactoryProtocol
    private let viewModelsFactory: ViewModelsFactoryProtocol
    
    init(viewsFactory: ViewsFactoryProtocol, viewModelsFactory: ViewModelsFactoryProtocol) {
        self.viewsFactory = viewsFactory
        self.viewModelsFactory = viewModelsFactory
    }
    
    func makeSplashViewController(flowDelegate: SplashFlowDelegate) -> SplashViewController {
        let contentView = viewsFactory.makeSplashView()
        let viewController = SplashViewController(contentView: contentView, flowDelegate: flowDelegate)
        return viewController
    }
    
    func makeLoginViewController(flowDelegate: LoginFlowDelegate) -> LoginViewController {
        let contentView = viewsFactory.makeLoginView()
        let viewModel = viewModelsFactory.makeLoginViewModel()
        let viewController = LoginViewController(contentView: contentView, viewModel: viewModel, flowDelegate: flowDelegate)
        return viewController
    }
}
