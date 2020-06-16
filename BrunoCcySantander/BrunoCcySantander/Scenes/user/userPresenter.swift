//
//  userPresenter.swift
//  BrunoCcySantander
//
//  Created by Bruno Chen on 16/06/20.
//  Copyright (c) 2020 Bruno Chen. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol userPresentationLogic
{
  func presentSomething(response: user.Something.Response)
}

class userPresenter: userPresentationLogic
{
  weak var viewController: userDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: user.Something.Response)
  {
    let viewModel = user.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}
