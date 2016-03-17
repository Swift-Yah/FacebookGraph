//
//  User.swift
//  FacebookGraph
//
//  Created by Rafael Ferreira on 3/16/16.
//  Copyright © 2016 Swift Yah. All rights reserved.
//

import ObjectMapper

class User: Mappable {
    
    var name: String?
    var id: String?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        id <- map["id"]
    }
    
}
