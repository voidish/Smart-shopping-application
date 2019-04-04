//
//  RemoteManager.swift
//  SmartShopping
//
//  Copyright © 2019 Saeed Masoodnia. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class RemoteManager {
    
    func getShops(callback: @escaping (NSError?, Array<Shop>?) -> ()) {
        
            Alamofire.request(UrlManager.ShopsURL(), encoding: JSONEncoding.default).responseJSON { response in
                switch response.result {
                case .success:
                    if let value = response.result.value {
                        let json = JSON(value)
                        print(json)
                        let status_code = response.response!.statusCode
                        let err_msg = "sorry there is a problem with the server"
                        switch status_code {
                        case 200:
                            var shops = Array<Shop>()
                            for (_,subJson):(String, JSON) in json {
                                let shop = Shop(j: subJson)
                                shops.append(shop)
                            }
                            if shops.count != 0 {
                                self.getBranches(callback: { (error, branches) in
                                    if error == nil {
                                        for shop in shops {
                                            for branch in branches! {
                                                if shop.id == branch.shopId {
                                                    shop.branches.append(branch)
                                                }
                                            }
                                        }
                                        callback(nil, shops)
                                    } else {
                                        let error = NSError(domain: "", code: status_code, userInfo: ["message" : err_msg])
                                        callback(error, nil)
                                    }
                                })
                            } else {
                                let error = NSError(domain: "", code: status_code, userInfo: ["message" : err_msg])
                                callback(error, nil)
                            }
                            
                            break
                        default:
                            let error = NSError(domain: "", code: status_code, userInfo: ["message" : err_msg])
                            callback(error, nil)
                            break
                        }
                        
                    }
                case .failure(let e):
                    let error = NSError(domain: e._domain, code: e._code , userInfo: ["message" : e.localizedDescription])
                    callback(error, nil)
                }
            }
    }
    
    
    
    func getBranches(callback: @escaping (NSError?, Array<Branch>?) -> ()) {
        
        Alamofire.request(UrlManager.BranchesURL(), encoding: JSONEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    let json = JSON(value)
                    print(json)
                    let status_code = response.response!.statusCode
                    let err_msg = "sorry there is a problem with the server"
                    switch status_code {
                    case 200:
                        var branches = Array<Branch>()
                        for (_,subJson):(String, JSON) in json {
                            let branch = Branch(j: subJson)
                            branches.append(branch)
                        }
                        if branches.count != 0 {
                            callback(nil, branches)
                        } else {
                            let error = NSError(domain: "", code: status_code, userInfo: ["message" : err_msg])
                            callback(error, nil)
                        }
                        break
                    default:
                        let error = NSError(domain: "", code: status_code, userInfo: ["message" : err_msg])
                        callback(error, nil)
                        break
                    }
                    
                }
            case .failure(let e):
                let error = NSError(domain: e._domain, code: e._code , userInfo: ["message" : e.localizedDescription])
                callback(error, nil)
            }
        }
    }
    
    func getProducts(callback: @escaping (NSError?, Array<Product>?) -> ()) {
        
        Alamofire.request(UrlManager.productsURL(), encoding: JSONEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    let json = JSON(value)
                    print(json)
                    let status_code = response.response!.statusCode
                    let err_msg = "sorry there is a problem with the server"
                    switch status_code {
                    case 200:
                        var products = Array<Product>()
                        for (_,subJson):(String, JSON) in json {
                            let product = Product(j: subJson)
                            products.append(product)
                        }
                        if products.count != 0 {
                            callback(nil, products)
                        } else {
                            let error = NSError(domain: "", code: status_code, userInfo: ["message" : err_msg])
                            callback(error, nil)
                        }
                        break
                    default:
                        let error = NSError(domain: "", code: status_code, userInfo: ["message" : err_msg])
                        callback(error, nil)
                        break
                    }
                    
                }
            case .failure(let e):
                let error = NSError(domain: e._domain, code: e._code , userInfo: ["message" : e.localizedDescription])
                callback(error, nil)
            }
        }
    }
}
