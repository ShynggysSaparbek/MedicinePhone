//
//  PhoneSavingTest.swift
//  MedicineProjectV2Tests
//
//  Created by w2 on 8/12/19.
//  Copyright © 2019 w2. All rights reserved.
//

import XCTest
@testable import MedicineProjectV2

class PhoneSavingTest: XCTestCase{
    var phone: PhoneStructure?
    var phoneService: PhoneService!
    override func setUp() {
        super.setUp()
        phoneService = PhoneService()
        phoneService.delete()
        
        let number = "+7(701) 700 2000"
        phone = PhoneStructure(number: number)
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    
    func testPhoneNumberSaved(){
        // when:
        phoneService.set(structure: phone!)
        let savedPhone = phoneService.get()
        //then
        XCTAssert(savedPhone?.number == phone?.number, "Phone Number is not saved")
    }
    
    func testPhoneNumberDeleted(){
        // when:
        phoneService.set(structure: phone!)
        phoneService.delete()
        
        let savedPhone = phoneService.get()
        // then:
        XCTAssertNil(savedPhone, "Phone Number is not deleted \(String(describing: savedPhone))")
    }
    
    func testPhoneWasChanged(){
        // given:
        let newNumber = "+7(701) 700 1005"
        let newPhone = PhoneStructure(number: newNumber)
        // when:
        phoneService.set(structure: phone!)
        phoneService.set(structure: newPhone)
        // then:
        let phone = phoneService.get()!
        XCTAssertTrue(phone.number == newNumber)
    }
    func testIsRegistred(){
        // when:
        phoneService.set(structure: phone!)
        // then:
        XCTAssertTrue(phoneService.isRegistred())
        phoneService.delete()
        XCTAssertFalse(phoneService.isRegistred())
    }
}
