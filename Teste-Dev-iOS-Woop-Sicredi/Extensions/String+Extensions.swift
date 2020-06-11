//
//  String+Extensions.swift
//  Teste-Dev-iOS-Woop-Sicredi
//
//  Created by Rodrigo Giglio on 11/06/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import Foundation

extension String {
    
    static let empty = ""
    
    func containsIgnoringCase(_ substring: String) -> Bool {
        return self.lowercased().contains(substring.lowercased())
    }
}
