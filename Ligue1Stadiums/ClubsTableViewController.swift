//
//  ViewController.swift
//  Ligue1Stadiums
//
//  Created by Brad Leege on 1/19/17.
//  Copyright © 2017 Brad Leege. All rights reserved.
//

import UIKit

class ClubsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        tableView.rowHeight = UITableViewAutomaticDimension
//        tableView.estimatedRowHeight = 216
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int{
        return 4
    }
    
    
    override func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "clubMapCell",
                                                 for: indexPath) as! ClubMapTableViewCell
        
        cell.mapImageView.backgroundColor = UIColor.red
        
        return cell
    }
    
}

