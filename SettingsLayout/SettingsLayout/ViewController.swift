//
//  ViewController.swift
//  SettingsLayout
//
//  Created by Admin on 5/3/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource{
    
    //mark : Table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return 6
        case 2:
            return 3
        default:
           return 1
        }
       
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cellIdentifier : String = "general"
        if( indexPath.row == 0 && indexPath.section == 0 ){
            cellIdentifier = "general"
            print(cellIdentifier)
        }else if (indexPath.row == 1 && indexPath.section == 0 ){
            cellIdentifier = "privacy"
        }else if (indexPath.row == 0 && indexPath.section == 1 ){
            cellIdentifier = "icloud"
        }else if (indexPath.row == 1 && indexPath.section == 1 ){
            cellIdentifier = "maps"
        }else if (indexPath.row == 2 && indexPath.section == 1 ){
            cellIdentifier = "safari"
        }else if (indexPath.row == 3 && indexPath.section == 1 ){
            cellIdentifier = "news"
        }else if (indexPath.row == 4 && indexPath.section == 1 ){
            cellIdentifier = "photo"
        }else if (indexPath.row == 5 && indexPath.section == 1 ){
            cellIdentifier = "game"
        }else if (indexPath.row == 0 && indexPath.section == 2 ){
            cellIdentifier = "twiter"
        }else if (indexPath.row == 1 && indexPath.section == 2 ){
            cellIdentifier = "facebook"
        }else if (indexPath.row == 2 && indexPath.section == 2 ){
            cellIdentifier = "vimeo"
        }
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier ,for : indexPath)
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

