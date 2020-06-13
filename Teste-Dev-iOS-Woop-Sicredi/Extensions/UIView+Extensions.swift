//
//  UIView+Extensions.swift
//  Teste-Dev-iOS-Woop-Sicredi
//
//  Created by Rodrigo Giglio on 13/06/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import UIKit


extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
