//
//  LoginViewDelegate.swift
//  Reminder
//
//  Created by Thiago Firsen on 09/02/25.
//

import UIKit

protocol LoginViewDelegate: AnyObject {
    func sendLoginData(user: String, password: String)
}
