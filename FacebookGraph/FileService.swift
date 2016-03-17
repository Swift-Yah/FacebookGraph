//
//  FileService.swift
//  FacebookGraph
//
//  Created by Rafael Ferreira on 3/17/16.
//  Copyright © 2016 Swift Yah. All rights reserved.
//

import UIKit

class FileService {
    
    static let sharedInstance = FileService()
    
    init() { }
    
    func geDocumentsURL() -> NSURL {
        let documentsURL = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
        return documentsURL
    }
    
    func fileInDocumentsDirectory(filename: String) -> String {
        let fileURL = geDocumentsURL().URLByAppendingPathComponent(filename)
        return fileURL.path!
    }
    
    func saveImage (image: UIImage, pathName: String ) -> Bool{
        let imagePath = fileInDocumentsDirectory(pathName)
        let pngImageData = UIImagePNGRepresentation(image)
        
        let result = pngImageData!.writeToFile(imagePath, atomically: true)
        
        return result
    }
    
}