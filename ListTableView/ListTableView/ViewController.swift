//
//  ViewController.swift
//  ListTableView
//
//  Created by Admin on 5/3/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellIdentifier : String = "drStrange"
        if( indexPath.row == 0  ){
            cellIdentifier = "drStrange"
            print(cellIdentifier)
        }else if (indexPath.row == 1 ){
            cellIdentifier = "captain"
        }else if (indexPath.row == 2  ){
            cellIdentifier = "thor"
        }else if (indexPath.row == 3  ){
            cellIdentifier = "iron2"
        }else if (indexPath.row == 4  ){
            cellIdentifier = "hulk"
        }else if (indexPath.row == 5  ){
            cellIdentifier = "iron"
        }else if (indexPath.row == 6 ){
            cellIdentifier = "civil"
        }else if (indexPath.row == 7 ){
            cellIdentifier = "antman"
        }else if (indexPath.row == 8 ){
            cellIdentifier = "guardian"
        }else if (indexPath.row == 9  ){
            cellIdentifier = "captain2"
        }
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier ,for : indexPath)
        return cell

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
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

