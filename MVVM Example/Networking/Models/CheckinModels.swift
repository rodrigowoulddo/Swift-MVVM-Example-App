//
//  CheckinModels.swift
//  Teste-Dev-iOS-Woop-Sicredi
//
//  Created by Rodrigo Giglio on 11/06/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import Foundation

struct CheckinInput: Encodable {
    
    let eventId: Int
    let name: String
    let email: String
}

struct CheckinResponse: Decodable {
    let code: String
}
