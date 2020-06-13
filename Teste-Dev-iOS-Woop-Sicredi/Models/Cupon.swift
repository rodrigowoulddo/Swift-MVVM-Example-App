//
//  Cupon.swift
//  Teste-Dev-iOS-Woop-Sicredi
//
//  Created by Rodrigo Giglio on 11/06/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import Foundation

struct Cupon: Decodable {
    
    let id: String
    let eventId: String
    let discount: Double
}
