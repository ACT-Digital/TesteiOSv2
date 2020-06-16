//
//  ValitationLoginData.swift
//  BrunoCcySantander
//
//  Created by Bruno Chen on 16/06/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import Foundation

protocol LocalInputsValidationProtocol {
    func isValidInputs(user: String?, password: String?) -> Bool
}

class LocalInputsValidation: LocalInputsValidationProtocol {
    
    func isValidInputs(user: String?, password: String?) -> Bool {
        var result: Bool = false
        
        if let userStr = user, isValidEmail(user: userStr) || isValidCpf(testStr: userStr) {
            if let passwordStr = password, isValidPassword(password: passwordStr) {
                result = true
            }
        }
        return result
        
    }
    
    // MARK: - Validate Email Locally
    
    func isValidEmail(user: String) -> Bool {
        let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: user)
            return result
    }
    
    // MARK: - Validate CPF Locally
    
    func isValidCpf(testStr: String) -> Bool {
        let CPFRegEx = "([0-9]{2}[.]?[0-9]{3}[.]?[0-9]{3}[/]?[0-9]{4}[-]?[0-9]{2})|([0-9]{3}[.]?[0-9]{3}[.]?[0-9]{3}[-]?[0-9]{2})"
        let CPFTest = NSPredicate(format: "SELF MATCHES %@", CPFRegEx)
        let result = CPFTest.evaluate(with: testStr)
        return result
    }
    
    // MARK: - Validate Password Locally
    
    func isValidPassword(password: String) -> Bool {
        let passwordRegEx = "^(?=.*[0-9])(?=.*[A-Z])(?=.*[!@#$%^&*]).{8,}$"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        let result = passwordTest.evaluate(with: password)
        return result
    }
    
    
}
