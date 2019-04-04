//
//  Shop.swift
//  SmartShopping
//
//  Copyright © 2019 Saeed Masoodnia. All rights reserved.
//

import Foundation
import SwiftyJSON
class Shop {
    
    var id: String
    var name: String
    var branches = Array<Branch>()
    
    init(j: JSON){
        self.id = j["_id"].stringValue
        self.name = j["shop_name"].stringValue
    }
    

}
