//
//  ViewController.swift
//  FacebookGraph
//
//  Created by Rafael Ferreira on 3/16/16.
//  Copyright © 2016 Swift Yah. All rights reserved.
//

import UIKit
import Async

class HomeViewController: UITableViewController {
    
    let facebookDao = FacebookDao.sharedInstance
    let fileService = FileService.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Async.background { [unowned self] in
            for person in self.facebookDao.peopleToEvaluate {
                person.onImageUpdated.listen(self) { (response: Person) -> Void in
                    
                    let saved = self.fileService.saveImage(person.image, pathName: person.pathNameToSave)
                    print("Foto foi salva? \(saved)")
                    
                }
                
                self.facebookDao.findFacebookId(person)
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: UITableViewController methods
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return facebookDao.peopleToEvaluate.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("UserTableViewCell", forIndexPath: indexPath) as! UserTableViewCell
        
        let index = indexPath.row
        let person = facebookDao.peopleToEvaluate[index]
        
        cell.setUpModel(person)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let row = indexPath.row
        let person = facebookDao.peopleToEvaluate[row]
        
        facebookDao.findFacebookId(person)
    }
    
    
}

