//
//  KeychainStore.swift
//  BrunoCcySantander
//
//  Created by Bruno Chen on 16/06/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import Foundation
import KeychainAccess

protocol KeychainServiceProtocol {
    func saveUserPassword(userID: String, password: String)
    func getUserPassword() -> (userID: String?, password: String?)
    func removeUserPassword()
    
}

class UserKeychainService: KeychainServiceProtocol {
    
    private let keychain = Keychain(server: "https://bank-app-test.herokuapp.com", protocolType: .https)
    
    func saveUserPassword(userID: String, password: String) {
        keychain["userID"] = userID
        keychain["password"] = password
        
    }
    
    func getUserPassword() -> (userID: String?, password: String?) {
        let useID = try? keychain.get("userID")
        let password = try? keychain.get("password")
        return (useID, password)
    }
    
    func removeUserPassword() {
        keychain["password"] = nil
        keychain["userID"] = nil
    }
}
