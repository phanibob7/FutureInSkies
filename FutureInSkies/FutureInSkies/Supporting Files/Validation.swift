//
//  Validation.swift
//  FutureInSkies
//
//  Created by phanindra on 24/09/18.
//  Copyright © 2018 Phanibob. All rights reserved.
//

import Foundation

class Validation: NSObject {
    
    public static let shared = Validation()
    
    func validate(values: (type: ValidationType, inputValue: String)...) -> Valid {
        for valueToBeChecked in values {
            switch valueToBeChecked.type {
            case .username:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .username, .emptyUsername, .invalidUsername)) {
                    return tempValue
                }
            
            case .password:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .password, .emptyPSW, .inValidPSW)) {
                    return tempValue
                }
            }
        }
        return .success
    }
    
    func isValidString(_ input: (text: String, regex: RegEx, emptyAlert: AlertMessages, invalidAlert: AlertMessages)) -> Valid? {
        if input.text.isEmpty {
            return .failure(.error, input.emptyAlert)
        } else if isValidRegEx(input.text, input.regex) != true {
            return .failure(.error, input.invalidAlert)
        }
        return nil
    }
    
    func isValidRegEx(_ testStr: String, _ regex: RegEx) -> Bool {
        let stringTest = NSPredicate(format:"SELF MATCHES %@", regex.rawValue)
        let result = stringTest.evaluate(with: testStr)
        return result
    }
}

enum AlertMessages: String {
    case invalidUsername = "Invalid Username"
    case inValidPSW = "Invalid Password"
    
    case emptyUsername = "Empty Username"
    case emptyPSW = "Empty Password"
    
    func localized() -> String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}
enum Alert {        //for failure and success results
    case success
    case failure
    case error
}
//for success or failure of validation with alert message
enum Valid {
    case success
    case failure(Alert, AlertMessages)
}
enum ValidationType {
    case username
    case password
}
enum RegEx: String {
    case username = "^[a-zA-Z0-9]*$" // e.g. sandeep005
    case password = "^.{6,15}$" // Password length 6-15
}
