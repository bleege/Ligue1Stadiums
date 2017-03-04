//
//  ClubMapDetailViewController.swift
//  Ligue1Stadiums
//
//  Created by Brad Leege on 3/3/17.
//  Copyright © 2017 Brad Leege. All rights reserved.
//

import UIKit
import MapKit

class ClubMapDetailViewController: UIViewController {

    @IBOutlet weak var clubDetailMap: MKMapView!

    var club: Club?
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let camera = MKMapCamera(lookingAtCenter: (club?.location)!, fromEyeCoordinate: (club?.location)!, eyeAltitude: 3000)
        clubDetailMap.setCamera(camera, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
