//
//  LocationSavingTest.swift
//  MedicineProjectV2Tests
//
//  Created by w2 on 8/15/19.
//  Copyright © 2019 w2. All rights reserved.
//

import XCTest
@testable import MedicineProjectV2

class LocationSavingTest: XCTestCase{
    override func setUp() {
        super.setUp()
        LocationManager.deleteAll()
        
    }
    
    override func tearDown() {
        LocationManager.deleteAll()
        super.tearDown()
    }
    
    func testLocationIsSaved(){
        // given:
        LocationManager.deleteAll()
        let name = "testLocationIsSavedExample"
        let longitude: Double = 0.0
        let latitude: Double = 0.0
        var location: LocationStructure? = LocationStructure(name: name,
                                         longitude: longitude,
                                         latitude: latitude)
        // when:
        LocationManager.add(structure: location!)
        location = LocationManager.get(by: name)
        //then
        XCTAssert(location?.name == name, "Location name is not saved")
        XCTAssert(location?.latitude == latitude, "Location latitude is not saved")
        XCTAssert(location?.longitude == longitude, "Location longitude is not saved")
        //after:
        LocationManager.deleteAll()
    }
    
    func testLocationIsDeleted(){
        // given:
        let name = "testLocationIsDeletedExample"
        let longitude: Double = 0.0
        let latitude: Double = 0.0
        let location = LocationStructure(name: name,
                                         longitude: longitude,
                                         latitude: latitude)
        // when:
        LocationManager.add(structure: location)
        LocationManager.delete(by: name)
        let savedLocation = LocationManager.get(by: name)
        
        // then:
        XCTAssertNil(savedLocation, "Location is not deleted")
        LocationManager.deleteAll()
    }
    
    func testLocationAdded(){

        // given:
        let homeName = "TestLocationAddedExample1"
        let homeLongitude: Double = 0.0
        let homeLatitude: Double = 0.0
        var homeLocation: LocationStructure? = LocationStructure(name: homeName,
                                         longitude: homeLongitude,
                                         latitude: homeLatitude)
        
        let workName = "TestLocationAddedExample2"
        let workLongitude: Double = 0.1
        let workLatitude: Double = 0.1
        var workLocation: LocationStructure? = LocationStructure(name: workName,
                                             longitude: workLongitude,
                                             latitude: workLatitude)
        // when:
        LocationManager.add(structure: homeLocation!)
        LocationManager.add(structure: workLocation!)
        // then:
        workLocation = LocationManager.get(by: workName)
        homeLocation = LocationManager.get(by: homeName)
        
        XCTAssertNotNil(homeLocation, "First Location is not added")
        XCTAssert(homeLocation?.longitude == homeLongitude,
                  "Home location longitude was not saved")
        XCTAssertNotNil(homeLocation?.latitude == homeLongitude,
                        "Home location latitude was not saved")
        
        XCTAssertNotNil(workLocation, "Second Location is not added")
        XCTAssert(workLocation?.longitude == workLongitude,
                  "Work location longitude was not saved")
        XCTAssertNotNil(workLocation?.latitude == workLongitude,
                        "Work location latitude was not saved")
        //after:
        LocationManager.deleteAll()
    }
    
    func testCount(){
        for i in 10...20{
            let name = String(i)
            let longitude: Double = Double(i*2)
            let latitude: Double = Double(i/2)
            let location = LocationStructure(name: name,
                                             longitude: longitude,
                                             latitude: latitude)
            LocationManager.add(structure: location)
        }
        let number = LocationManager.count()
        XCTAssert(number == 11, "Total number of saved locations(\(LocationManager.getAll())) is not equal to number of added locations(11)")
        //after:
        LocationManager.deleteAll()
    }
}
