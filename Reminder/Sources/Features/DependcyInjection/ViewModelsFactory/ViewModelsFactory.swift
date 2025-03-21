//
//  ViewModelsFactory.swift
//  Reminder
//
//  Created by Thiago Firsen on 15/02/25.
//

final class ViewModelsFactory: ViewModelsFactoryProtocol {
    func makeLoginViewModel() -> LoginViewModel {
        let viewModel = LoginViewModel()
        return viewModel
    }
    
    func makeHomeViewModel() -> HomeViewModel {
        let viewModel = HomeViewModel()
        return viewModel
    }
    
    func makeNewReceiptViewModel() -> NewReceiptViewModel {
        let viewModel = NewReceiptViewModel()
        return viewModel
    }
    
    func makeMyReceiptsViewModel() -> MyReceiptsViewModel {
        let viewModel = MyReceiptsViewModel()
        return viewModel
    }
}
