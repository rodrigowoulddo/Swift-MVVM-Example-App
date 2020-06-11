//
//  EventEndpoints.swift
//  Teste-Dev-iOS-Woop-Sicredi
//
//  Created by Rodrigo Giglio on 11/06/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import Foundation
import Moya

enum EventEndpoints: TargetType {
    
    case getAll
    case get(id: Int)
    
    var path: String {
        
        switch self {
            
            case .getAll: return "/events"
            case .get(let id): return "/events/\(id)"
        }
    }
    
    var method: Moya.Method {
        
        switch self {
            
            case .getAll: return .get
            case .get: return .get
        }
    }
    
    var task: Task {
        
        switch self {
            
            case .getAll: return .requestPlain
            case .get: return .requestPlain
        }
    }
    
}
