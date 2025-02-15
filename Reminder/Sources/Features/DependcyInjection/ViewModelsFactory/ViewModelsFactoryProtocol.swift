//
//  ViewModelsFactoryProtocol.swift
//  Reminder
//
//  Created by Thiago Firsen on 15/02/25.
//

protocol ViewModelsFactoryProtocol: AnyObject {
    func makeLoginViewModel() -> LoginViewModel
}
