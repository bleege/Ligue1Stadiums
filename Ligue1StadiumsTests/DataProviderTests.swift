//
//  DataProviderTests.swift
//  Ligue1Stadiums
//
//  Created by Brad Leege on 1/29/17.
//  Copyright © 2017 Brad Leege. All rights reserved.
//

import XCTest
import CoreLocation

class DataProviderTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLoadClubData() {
        var clubs = [Club]()
        
        clubs.append(contentsOf: DataProvider.loadClubData())
        
        XCTAssertTrue(clubs.count == 20)
    }
    
}
