//
//  GeoJSONParser.swift
//  Ligue1Stadiums
//
//  Created by Brad Leege on 1/25/17.
//  Copyright © 2017 Brad Leege. All rights reserved.
//

import Foundation
import CoreLocation

class DataProvider {
    
    
    static func loadClubData () -> [Club] {
        var clubs = [Club]()

        var c = Club(clubName: "Test Club FC", location: CLLocationCoordinate2DMake(43.07472, -89.38421))

        clubs.append(c)
        
        return clubs
    }
    
}
