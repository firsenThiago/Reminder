//
//  UserDefaultsManager.swift
//  Reminder
//
//  Created by Thiago Firsen on 18/02/25.
//

import Foundation

class UserDefaultsManager {
    private static let userKey = "userKey"
    
    static func saveUser(user: User) {
       let enconder = JSONEncoder()
        if let data = try? enconder.encode(user) {
            UserDefaults.standard.set(data, forKey: userKey)
        }
    }
    
    static func loadUser() -> User? {
        guard let data = UserDefaults.standard.data(forKey: userKey) else { return nil }
        let deconder = JSONDecoder()
        return try? deconder.decode(User.self, from: data)
    }
}
