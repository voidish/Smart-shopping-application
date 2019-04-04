//
//  Config.swift
//  SmartShopping
//
//  Copyright © 2019 Saeed Masoodnia. All rights reserved.
//

import Foundation
import Alamofire

let urlDev = "https://smart-shopping-application.herokuapp.com/"
let urlProduction = "https://"

struct Config {
    let apiServer:String
    
    init(apiServer: String) {
        self.apiServer = apiServer
    }
}

func devEnvironment() -> Config {
    return Config(apiServer: urlDev)
}

func productionEnvironment() -> Config {
    return Config(apiServer: urlProduction)
}

//set configuration to dev or production
let globalConfig:Config = devEnvironment()
