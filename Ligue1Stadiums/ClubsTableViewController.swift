//
//  ViewController.swift
//  Ligue1Stadiums
//
//  Created by Brad Leege on 1/19/17.
//  Copyright © 2017 Brad Leege. All rights reserved.
//

import UIKit

class ClubsTableViewController: UITableViewController {

    var clubs = [Club]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadClubData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func loadClubData() {
        DispatchQueue.global(qos: .background).async {
            let clubLoad = DataProvider.loadClubData()
            
            DispatchQueue.main.async {
                self.clubs.removeAll()
                self.clubs.append(contentsOf: clubLoad)
                self.tableView.reloadData()
            }
        }
    }
    
    
    override func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int{
        return clubs.count
    }
    
    
    override func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "clubMapCell",
                                                 for: indexPath) as! ClubMapTableViewCell
        
        cell.mapImageView.backgroundColor = UIColor.white
        cell.mapImageView.layer.cornerRadius = 10
//        cell.mapImageView.layer.masksToBounds = true
        
        cell.mapImageView.layer.shadowOffset = CGSize(width: 0, height: 0)
        cell.mapImageView.layer.shadowColor = UIColor.black.cgColor
        cell.mapImageView.layer.shadowRadius = 4
        cell.mapImageView.layer.shadowOpacity = 0.25
        cell.mapImageView.layer.masksToBounds = false;

        return cell
    }
    
}

