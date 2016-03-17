//
//  FacebookEndPoint.swift
//  FacebookGraph
//
//  Created by Rafael Ferreira on 3/16/16.
//  Copyright © 2016 Swift Yah. All rights reserved.
//

import Alamofire

enum FacebookEndPoint {
    
    case Search(Person)
    case Picture(Person)
    
}

extension FacebookEndPoint {
    
    func getRequestMethod() -> Method {
        return .GET
    }
    
    func getEndPoint() -> String {
        switch (self) {
        case .Search:
            return "/search"
            
        case .Picture:
            return "/%@/picture"
        }
    }
    
    func getUrl() -> NSURL {
        var urlString = FacebookApi.facebookGraphUrl + getEndPoint()
        
        switch (self) {
        case .Picture(let person):
            urlString = String(format: urlString, person.facebookId)
            
        default: break
        }
        
        return NSURL(string: urlString)!
    }
    
    func getParameters(numberOfInterations: Int = 0) -> [String: AnyObject] {
        switch (self) {
        case .Search(let person):
            var q = String()
            let nameArray: [String] = person.name.componentsSeparatedByString(" ")
            
            switch (numberOfInterations) {
            case 0:
                q = person.email.isEmpty ? person.name : person.email
                break
                
            case 1:
                q = person.name
                break
                
            case 2:
                if let firstName = nameArray.first, _ = nameArray.last {
                    let secondName = nameArray[1]
                    q = String(format: FacebookApi.formatFullName, firstName, secondName)
                }
                break
                
            default:
                if let firstName = nameArray.first, lastName = nameArray.last {
                    q = String(format: FacebookApi.formatFullName, firstName, lastName)
                }
            }
            
            return [
                "q": q,
                "access_token": FacebookApi.accessToken,
                "type": "user"
            ]
            
        case .Picture:
            return [
                "access_token": FacebookApi.accessToken,
                "width": FacebookApi.widthProfilePicture,
                "height": FacebookApi.heightProfilePicture
            ]
        }
    }
    
}
