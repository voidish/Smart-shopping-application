//
//  UrlManager.swift
//  SmartShopping
//
//  Copyright © 2019 Saeed Masoodnia. All rights reserved.
//

import Foundation

class UrlManager {
    
    static func productsURL() -> String {
        return globalConfig.apiServer + "products/all"
    }
    
    static func ShopsURL() -> String {
        return globalConfig.apiServer + "shops"
    }
    
    static func BranchesURL() -> String {
        return globalConfig.apiServer + "branches"
    }
}
