//
//  GenderSavingTest.swift
//  MedicineProjectV2Tests
//
//  Created by w2 on 8/14/19.
//  Copyright © 2019 w2. All rights reserved.
//

import XCTest
@testable import MedicineProjectV2

class GenderSavingTest: XCTestCase {
    var genderService: GenderService!
    
    var gender: GenderStructure!
    override func setUp() {
        super.setUp()
        genderService = GenderService()
        genderService.delete()
        
        let status = "male"
        gender = GenderStructure(status: status)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testGenderSaved(){
        genderService.set(structure: gender)
        let savedGender = genderService.get()
        //then
        XCTAssert(savedGender?.status == gender.status, "Gender status(\(String(describing: savedGender))) is not saved")
    }

    func testGenderNumberDeleted(){
        // when:
        genderService.set(structure: gender)
        genderService.delete()
        let savedGender = genderService.get()
        // then:
        XCTAssertNil(savedGender, "Phone Number is not deleted")
    }
    
    func testPhoneWasChanged(){
        // given:
        let newStatus = "male"
        let newGender = GenderStructure(status: newStatus)
        // when:
        genderService.set(structure: gender)
        genderService.set(structure: newGender)
        // then:
        let savedGender = genderService.get()
        XCTAssertTrue(savedGender?.status == newStatus)
    }
    
    func testIsRegistred(){
        // when:
        genderService.set(structure: gender)
        // then:
        XCTAssertTrue(genderService.isRegistred())
        genderService.delete()
        XCTAssertFalse(genderService.isRegistred())
    }
}

