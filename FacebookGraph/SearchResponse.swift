//
//  SearchResponse.swift
//  FacebookGraph
//
//  Created by Rafael Ferreira on 3/17/16.
//  Copyright © 2016 Swift Yah. All rights reserved.
//

import ObjectMapper

class SearchResponse: Mappable {
    
    var users: [User]?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        users <- map["data"]
    }
    
}
