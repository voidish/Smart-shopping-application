//
//  Hud.swift
//  SmartShopping
//
//  Copyright © 2019 Saeed Masoodnia. All rights reserved.
//

import Foundation
import PKHUD

class Hud {
    
    public static func showProgress() {
        HUD.show(.progress)
    }
    
    public static func showMessage(message: String) {
        HUD.flash(.label(message), delay: 1.0)
    }
    
    public static func hide() {
        HUD.hide()
    }
}
