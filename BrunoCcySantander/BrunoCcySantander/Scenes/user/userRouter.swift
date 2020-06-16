//
//  userRouter.swift
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

@objc protocol userRoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol userDataPassing
{
  var dataStore: userDataStore? { get }
}

class userRouter: NSObject, userRoutingLogic, userDataPassing
{
  weak var viewController: userViewController?
  var dataStore: userDataStore?
  
  // MARK: Routing
  
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
  //  if let segue = segue {
  //    let destinationVC = segue.destination as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //  } else {
  //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //  }
  //}

  // MARK: Navigation
  
  //func navigateToSomewhere(source: userViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: userDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}
