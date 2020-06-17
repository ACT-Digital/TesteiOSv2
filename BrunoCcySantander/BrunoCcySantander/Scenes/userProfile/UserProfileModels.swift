//
//  UserProfileModels.swift
//  BrunoCcySantander
//
//  Created by Bruno Chen on 17/06/20.
//  Copyright (c) 2020 Bruno Chen. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum UserProfile
{
  // MARK: Use cases
  
  enum UserInfo
  {
    struct Request {
        
    }
    
    struct Response {
        var userData: UserData
    }
    
    struct ViewModel: Equatable {
        var name: String
        var bankAgencyAccount: String
        var balance: String
    }
  }
  
  enum StatementListInfo
  {
    struct Request {
    }
    
    struct Response: Equatable
    {
        var statementList: [StatementList]
    }
    
    struct ViewModel: Equatable {
        
        struct DisplayedStatement: Equatable {
            var title: String
            var desc: String
            var date: String
            var value: String
        }
        var displayedStatement: [DisplayedStatement]
    }
    
  }
}

func ==(lhs: UserProfile.StatementListInfo.Response, rhs: UserProfile.StatementListInfo.Response) -> Bool
{
  return lhs.statementList == rhs.statementList
}

func ==(lhs: UserProfile.UserInfo.ViewModel, rhs: UserProfile.UserInfo.ViewModel) -> Bool
{
  return lhs.name == rhs.name
    && lhs.bankAgencyAccount == rhs.bankAgencyAccount
    && lhs.balance == rhs.balance
}

func ==(lhs: UserProfile.StatementListInfo.ViewModel, rhs: UserProfile.StatementListInfo.ViewModel) -> Bool
{
    return lhs.displayedStatement == rhs.displayedStatement

}

func ==(lhs: UserProfile.StatementListInfo.ViewModel.DisplayedStatement, rhs: UserProfile.StatementListInfo.ViewModel.DisplayedStatement) -> Bool
{
  return lhs.title == rhs.title
    && lhs.desc == rhs.desc
    && lhs.date == rhs.date
    && lhs.value == rhs.value
}

