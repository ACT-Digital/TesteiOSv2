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
    func fetchUser(user: String, password: String, completionHandler: @escaping (Result<UserData, APIServiceError>) -> Void)
    func fetchStatementList(userID: String, completionHandler: @escaping (Result<StatementListData, APIServiceError>) -> Void)
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
    
    func fetchUser(user: String, password: String, completionHandler: @escaping (Result<UserData, APIServiceError>) -> Void) {

        AF.request(NetworkPath.login.url, method: .post, parameters: ["user": user, "password": password]).responseJSON { (response) in
            guard let data = response.data else {
                completionHandler(.failure(.noData))
                return
            }
            do {
                let userData = try JSONDecoder().decode(UserData.self, from: data)
                completionHandler(.success(userData))
            } catch {
                completionHandler(.failure(.decodeError))
            }
        }.resume()
    }
    
    // MARK: - Fetch Statement - Optional error

    func fetchStatementList(userID: String, completionHandler: @escaping (Result<StatementListData, APIServiceError>) -> Void) {

        AF.request(NetworkPath.statements.url).responseJSON {  (response) in
            guard let data = response.data else {
                completionHandler(.failure(.noData))
                return
            }
            do {
                let statementListData = try JSONDecoder().decode(StatementListData.self, from: data)
                completionHandler(.success(statementListData))
            } catch {
                completionHandler(.failure(.decodeError))
            }
        }.resume()
    }
}

public enum APIServiceError: Error {
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case decodeError
}
