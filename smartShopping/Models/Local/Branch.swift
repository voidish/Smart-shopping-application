//
//  Branch.swift
//  SmartShopping
//
//  Copyright © 2019 Saeed Masoodnia. All rights reserved.
//

import Foundation
import SwiftyJSON
class Branch {
    
    var id: String
    var name: String
    var latitude: Double
    var longitude: Double
    var shopId: String
    
    init(j: JSON){
        self.id = j["_id"].stringValue
        self.name = j["branch_name"].stringValue
        self.latitude = j["lat"].doubleValue
        self.longitude = j["long"].doubleValue
        self.shopId = j["shop_id"].stringValue
    }
    
}
