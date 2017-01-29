//
//  Club.swift
//  Ligue1Stadiums
//
//  Created by Brad Leege on 1/28/17.
//  Copyright © 2017 Brad Leege. All rights reserved.
//

import Foundation
import CoreLocation

struct Club {
    
    let clubName:String
    let location:CLLocationCoordinate2D

    init(clubName:String, location:CLLocationCoordinate2D) {
        self.clubName = clubName
        self.location = location
    }
    
}
