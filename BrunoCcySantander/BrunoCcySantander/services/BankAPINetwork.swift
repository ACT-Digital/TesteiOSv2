//
//  BankAPINetwork.swift
//  BrunoCcySantander
//
//  Created by Bruno Chen on 16/06/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import Foundation
import Alamofire

protocol BankAPINetworkProtocol {
    func fetchUser(user: String, password: String, completionHandler: @escaping (UserData?, UserStoreError?) -> Void)
    func fetchStatementList(userID: String, completionHandler: @escaping (StatementListData?, UserStoreError?) -> Void)
}

class BankAPINetwork: BankAPINetworkProtocol {

    private enum NetworkPath: String {
        case login
        case statements = "statements/1"
        
        static let baseURL = "https://bank-app-test.herokuapp.com/api/"
        
        var url: String {
            return NetworkPath.baseURL + self.rawValue
        }
    }
    
    
    // MARK: - Fetch User - Optional error
    
    func fetchUser(user: String, password: String, completionHandler: @escaping (UserData?, UserStoreError?) -> Void) {

        AF.request(NetworkPath.login.url, method: .post, parameters: ["user": user, "password": password]).responseJSON { (response) in
            guard let data = response.data else {
                completionHandler(nil , .CannotFetch("Cannot fetch data"))
                return
            }
            do {
                let userData = try JSONDecoder().decode(UserData.self, from: data)
                completionHandler(userData, nil)
            } catch let DecodingError.dataCorrupted(context) {
                print(context)
                completionHandler(nil , .CannotFetch("Cannot fetch data"))
            } catch let DecodingError.keyNotFound(key, context) {
                print("Key '\(key)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
                completionHandler(nil , .CannotFetch("Cannot fetch data"))
            } catch let DecodingError.valueNotFound(value, context) {
                print("Value '\(value)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
                completionHandler(nil , .CannotFetch("Cannot fetch data"))
            } catch let DecodingError.typeMismatch(type, context)  {
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
                completionHandler(nil , .CannotFetch("Cannot fetch data"))
            } catch {
                print("error: ", error)
                completionHandler(nil , .CannotFetch("Cannot fetch data"))
            }
        }
        
    }
    
    // MARK: - Fetch Statement - Optional error

    func fetchStatementList(userID: String, completionHandler: @escaping (StatementListData?, UserStoreError?) -> Void) {

        AF.request(NetworkPath.statements.url).responseJSON { (response) in
            guard let data = response.data else {
                completionHandler(nil , .CannotFetch("Cannot fetch data"))
                return
            }
            do {
                let statementListData = try JSONDecoder().decode(StatementListData.self, from: data)
                completionHandler(statementListData, nil)
            } catch let DecodingError.dataCorrupted(context) {
                print(context)
                completionHandler(nil , .CannotFetch("Cannot fetch data"))
            } catch let DecodingError.keyNotFound(key, context) {
                print("Key '\(key)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
                completionHandler(nil , .CannotFetch("Cannot fetch data"))
            } catch let DecodingError.valueNotFound(value, context) {
                print("Value '\(value)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
                completionHandler(nil , .CannotFetch("Cannot fetch data"))
            } catch let DecodingError.typeMismatch(type, context)  {
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
                completionHandler(nil , .CannotFetch("Cannot fetch data"))
            } catch {
                completionHandler(nil , .CannotFetch("Cannot fetch data"))
                print("error: ", error)
            }
        }
        
    }
    
}

// MARK: - User store CRUD operation errors

enum UserStoreError: Equatable, Error {

  case CannotFetch(String)
    
}
