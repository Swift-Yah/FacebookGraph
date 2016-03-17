//
//  ImageAutoDownloadable.swift
//  FacebookGraph
//
//  Created by Rafael Ferreira on 3/17/16.
//  Copyright © 2016 Swift Yah. All rights reserved.
//

import UIKit

protocol ImageAutoDownloadable {
    
    var pathNameToSave: String { get }
    
    func updateImage()
    
}