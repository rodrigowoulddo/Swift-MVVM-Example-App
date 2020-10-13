//
//  PriceeFormatter.swift
//  MVVM Example
//
//  Created by Rodrigo Giglio on 13/10/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import Foundation

class PriceFormatter {
    
    public static func format(_ value: Double?) -> String {
        
        guard let value = value, value > 0 else {
            return "Grátis"
        }
        
        return "R$ \(value.formatted)"
    }
}
