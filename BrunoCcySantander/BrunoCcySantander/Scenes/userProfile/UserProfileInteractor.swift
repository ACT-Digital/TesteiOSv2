//
//  UserProfileInteractor.swift
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

protocol UserProfileBusinessLogic
{
  func getUserInfo()
  func getStatementListInfo(request: UserProfile.StatementListInfo.Request)
  func logoutUser()
}

protocol UserProfileDataStore
{
  var userData: UserData? { get set }
}

class UserProfileInteractor: UserProfileBusinessLogic, UserProfileDataStore
{
  var presenter: UserProfilePresentationLogic?
  var worker: UserProfileWorkerProtocol?
  var userData: UserData?
  
  // MARK: Do something
  
  func getUserInfo()
  {
    let response = UserProfile.UserInfo.Response(userData: userData!)
    presenter?.presentUserInfo(response: response)
  }
    
  func getStatementListInfo(request: UserProfile.StatementListInfo.Request)
  {
    worker = worker ?? UserProfileWorker()
    worker?.fetchStatementList(completionHandler: { (statementList) in
        let response = UserProfile.StatementListInfo.Response(statementList: statementList)
        self.presenter?.presentStatementList(response: response)
    })
  }
    
    func logoutUser() {
        UserKeychainService().removeUserPassword()
    }
    
}
