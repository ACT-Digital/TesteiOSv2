//
//  Extensions.swift
//  BrunoCcySantander
//
//  Created by Bruno Chen on 17/06/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import Foundation

extension NSNumber {
    func toPrice() -> String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        
        if let priceString = currencyFormatter.string(from: self) {
            return priceString
        }

        return currencyFormatter.string(from: 0)!
    }
}

extension Double {
    func toPrice() -> String {
        return (self as NSNumber).toPrice()
    }
}

extension Float {
    func toPrice() -> String {
        return (self as NSNumber).toPrice()
    }
}
