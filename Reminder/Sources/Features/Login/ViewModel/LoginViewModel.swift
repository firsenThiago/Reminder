//
//  LoginViewModel.swift
//  Reminder
//
//  Created by Thiago Firsen on 10/02/25.
//

import Foundation
import Firebase

class LoginViewModel {    
    
    func doAuth(username: String, password: String, completion: @escaping (() -> Void)) {
        Auth.auth().signIn(withEmail: username, password: password) { [weak self ] authDataResult, error in
            if let error = error {
                print("Autenticação falhou - \(error)")
            } else {
                completion()
            }
        }
    }
}
