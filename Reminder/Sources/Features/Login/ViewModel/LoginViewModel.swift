//
//  LoginViewModel.swift
//  Reminder
//
//  Created by Thiago Firsen on 10/02/25.
//

import Foundation
import Firebase

class LoginViewModel {    
    
    func doAuth(email: String, password: String,
                handleError: @escaping (String) -> Void,
                handleSuccess: @escaping (String) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authDataResult, error in
            if let error = error {
                handleError(error.localizedDescription)
            } else {
                handleSuccess(email)
            }
        }
    }
}
