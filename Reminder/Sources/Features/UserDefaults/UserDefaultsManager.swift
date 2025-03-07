//
//  UserDefaultsManager.swift
//  Reminder
//
//  Created by Thiago Firsen on 18/02/25.
//

import Foundation

class UserDefaultsManager {
    private static let userKey = "userKey"
    private static let userNameKey = "userNameKey"
    
    static func saveUser(user: User) {
       let enconder = JSONEncoder()
        if let data = try? enconder.encode(user) {
            UserDefaults.standard.set(data, forKey: userKey)
        }
    }
    
    static func saveUserName(name: String) {
        UserDefaults.standard.set(name, forKey: userNameKey)
    }
    
    static func loadUser() -> User? {
        guard let data = UserDefaults.standard.data(forKey: userKey) else { return nil }
        let deconder = JSONDecoder()
        return try? deconder.decode(User.self, from: data)
    }
    
    static func loadUserName() -> String? {
        return UserDefaults.standard.string(forKey: userNameKey)
    }
    
    static func removeUser() {
        UserDefaults.standard.removeObject(forKey: userKey)
    }
    
    static func removeUserName() {
        UserDefaults.standard.removeObject(forKey: userNameKey)
    }
}
