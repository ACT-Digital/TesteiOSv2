//
//  loginModels.swift
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

enum Login {
  // MARK: Use cases
  
    enum verify {
        struct Request {
            var user: String
            var password: String
        }
        struct Response {
            var allowed: Bool
        }
        struct ViewModel {
            var allowed: Bool
        }
    }
    enum savedLogin {
      struct Request {
      }
      struct Response {
        var userID: String?
        var password: String?
      }
      struct ViewModel {
        var userID: String?
        var password: String?
      }
    }
}
