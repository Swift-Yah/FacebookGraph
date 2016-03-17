//
//  Person.swift
//  FacebookGraph
//
//  Created by Rafael Ferreira on 3/16/16.
//  Copyright © 2016 Swift Yah. All rights reserved.
//

import Alamofire
import AlamofireImage
import Signals

class Person {
    
    var name = String()
    var email = String()
    var image: UIImage = UIImage(named: "Avatar")!
    
    var facebookId = String() {
        didSet { updateImage() }
    }
    
    let onImageUpdated = Signal<Person>()
    
}

extension Person {
    
    convenience init(name: String, email: String = String()) {
        self.init()
        
        self.name = name
        self.email = email
    }
    
}

extension Person: ImageAutoDownloadable {
    
    var pathNameToSave: String {
        let format = "%@.png"
        
        return String(format: format, name)
    }
    
    func updateImage() {
        guard !self.facebookId.isEmpty else { return }
        
        let endPoint = FacebookEndPoint.Picture(self)
        
        request(endPoint.getRequestMethod(), endPoint.getUrl(), parameters: endPoint.getParameters())
            .responseImage { (response: Response<Image, NSError>) -> Void in
                print(endPoint.getUrl())
                
                guard let image = response.result.value else { return }
                
                self.image = image
                
                self.onImageUpdated.fire(self)
        }
    }
    
}

func == (lhs: Person, rhs: Person) -> Bool {
    let sameName = lhs.name == rhs.name
    let sameEmail = lhs.email == rhs.email
    
    return sameName && sameEmail
}

