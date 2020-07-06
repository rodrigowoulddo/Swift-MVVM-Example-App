//
//  Validator.swift
//  Teste-Dev-iOS-Woop-Sicredi
//
//  Created by Rodrigo Giglio on 13/06/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import Foundation

class Validator {
    
    public static func validateEmail(_ email: String) -> Bool {
        
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailPred.evaluate(with: email)
    }
}
