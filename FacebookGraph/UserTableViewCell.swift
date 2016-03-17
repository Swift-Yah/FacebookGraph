//
//  UserTableViewCell.swift
//  FacebookGraph
//
//  Created by Rafael Ferreira on 3/17/16.
//  Copyright © 2016 Swift Yah. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var facebookIdLabel: UILabel!
    
    func setUpModel(model: Person) {
        pictureImageView.image = model.image
        nameLabel.text = model.name
        emailLabel.text = model.email
        facebookIdLabel.text = model.facebookId
    }
    
}
