//
//  CheckinEndpoints.swift
//  Teste-Dev-iOS-Woop-Sicredi
//
//  Created by Rodrigo Giglio on 11/06/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import Foundation
import Moya

enum CheckinEndpoints: TargetType {
    
    case checkin(input: CheckinInput)
    
    var path: String {
        switch self {
            case .checkin: return "/checkin"
        }
    }
    
    var method: Moya.Method {
        switch self {
            case .checkin: return .post
        }
    }
    
    var task: Task {
        switch self {
            case .checkin(let input): return .requestJSONEncodable(input)
        }
    }
    
}
