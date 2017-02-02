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

        
        do {
            let jsonPath = Bundle.main.path(forResource: "clubs", ofType: "geojson")
            let url = URL(fileURLWithPath: jsonPath!)
            let jsonData = try Data(contentsOf: url)
            let jsonDict = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String : AnyObject]
            
            let features = jsonDict?["features"] as? NSArray
            for feature in features! {
                let feature = feature as? NSDictionary
                let props = feature?["properties"] as? NSDictionary
                let clubName = props?["clubName"] as? String
                let geometry = feature?["geometry"] as? NSDictionary
                let locations = geometry?["coordinates"] as? [Double]
                                
                let coordinate = CLLocationCoordinate2D(latitude: (locations?[1])!, longitude: (locations?[0])!)

                let c = Club(clubName: clubName!, location: coordinate)
                
                clubs.append(c)
            }
        } catch {
            print("Failed to parse GeoJSON")
        }

        return clubs
    }
    
}
