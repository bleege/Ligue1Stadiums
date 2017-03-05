//
//  ViewController.swift
//  Ligue1Stadiums
//
//  Created by Brad Leege on 1/19/17.
//  Copyright © 2017 Brad Leege. All rights reserved.
//

import UIKit
import MapKit

class ClubsTableViewController: UITableViewController {

    var clubs = [Club]()
    var clubMapImage = [String:UIImage]()
    var selectedClub:Club?
    
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
        
        // Get Image
        let club = clubs[indexPath.row]
        
        // Check The Cache First
        if let img = clubMapImage[club.clubName] {
            cell.mapImageView.image = img
        } else {
        
            let options = MKMapSnapshotOptions()
            options.scale = UIScreen.main.scale
            options.size = cell.mapImageView.frame.size
            options.camera = MKMapCamera(lookingAtCenter: club.location, fromEyeCoordinate: club.location, eyeAltitude: 1000)
        
            let mapMaker: MKMapSnapshotter = MKMapSnapshotter(options: options)
            mapMaker.start(with: DispatchQueue.global(qos: .background), completionHandler: { snapshot, error in
                guard snapshot != nil else {
//                  withCallback(nil, error)
                    return
                }
            
                if let image = snapshot?.image {
//                withCallback(image, nil)
                    print("image  = \(image)")
                    DispatchQueue.main.async {
                        self.clubMapImage[club.clubName] = image
                        cell.mapImageView.image = image
                        self.tableView.reloadData()
                    }
                }
            })
        }
        
        cell.mapImageView.backgroundColor = UIColor.white
        cell.mapImageView.layer.cornerRadius = 10
        cell.mapImageView.layer.masksToBounds = true
        
        cell.clubNameLabel.text = club.clubName
        
//        cell.mapImageView.layer.shadowOffset = CGSize(width: 0, height: 0)
//        cell.mapImageView.layer.shadowColor = UIColor.black.cgColor
//        cell.mapImageView.layer.shadowRadius = 4
//        cell.mapImageView.layer.shadowOpacity = 0.25
//        cell.mapImageView.clipsToBounds = false

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedClub = clubs[indexPath.row]
        self.performSegue(withIdentifier: "showClubMapDetailSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "showClubMapDetailSegue") {
            let dest = segue.destination as! ClubMapDetailViewController
            dest.club = selectedClub
        }
    }
    
    @IBAction func unwindToClubsTable(segue: UIStoryboardSegue) { }

    
}

