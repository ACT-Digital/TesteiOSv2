//
//  StatementListData.swift
//  BrunoCcySantander
//
//  Created by Bruno Chen on 16/06/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import Foundation

// MARK: - User statement list

struct StatementListData: Codable, Equatable {
    let statementList: [StatementList]
    let error: ErrorAPI
    
}

// MARK: - Error
struct ErrorAPI: Codable, Equatable {
}

// MARK: - StatementList
struct StatementList: Codable, Equatable {
    let title: String
    let desc: String
    let date: String
    let value: Double
}
