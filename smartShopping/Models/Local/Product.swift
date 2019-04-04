//
//  Product.swift
//  SmartShopping
//
//  Copyright © 2019 Saeed Masoodnia. All rights reserved.
//

import Foundation
import SwiftyJSON
class Product {
    
    var id: String
    var name: String
    var urlImage: String
    var normalPrice: String
    var offerPrice: String
    var shopId: String
    var categoryId: String
    var quantity: Int = 1
    
    init(j: JSON){
        self.id = j["_id"].stringValue
        self.name = j["product_name"].stringValue
        self.urlImage = j["image_url"].stringValue
        self.normalPrice = j["product_price"]["normal_price"].stringValue
        self.offerPrice = j["product_price"]["offer_price"].stringValue
        self.shopId = j["shop_id"].stringValue
        self.categoryId = j["category_id"].stringValue
    }
    
    
}
