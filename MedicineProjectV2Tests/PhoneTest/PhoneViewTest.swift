//
//  PhoneInteractorTest.swift
//  MedicineProjectV2Tests
//
//  Created by w2 on 8/20/19.
//  Copyright © 2019 w2. All rights reserved.
//

import XCTest

@testable import MedicineProjectV2

class PhoneViewTest: XCTestCase {
    var storyBoard: UIStoryboard!
    var vc: PhoneViewController!
    override func setUp() {
        storyBoard = UIStoryboard(name: "Main", bundle: nil)
        vc = storyBoard.instantiateViewController(withIdentifier: String(describing: PhoneViewController.self)) as? PhoneViewController
        vc.loadViewIfNeeded()
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testButtonIsNotNilWhenViewIsLoaded(){
        XCTAssertNotNil(vc.saveButton, "Save button is nil")
    }
    
    func testTextFieldIsNotNilWhenViewIsLoaded(){
        XCTAssertNotNil(vc.textField, "Text field is nil")
    }
    
    func testConfiguratorIsNotWhenViewIsLoaded(){
        XCTAssertNotNil(vc.configurator, "PhoneConfigurator is nil")
    }
    
    func testPhoneNumberIsSetWhenButtonPressed(){
        // given:
        let number = "8(701) 700 2000"
        vc.textField.text = number
        // when:
        vc.savePhoneNumberButton(vc.saveButton)
        let savedNumber = vc.presenter.getPhoneNumber()
        // then:
        XCTAssertEqual(number, savedNumber, "Original number(\(number)) and saved number(\(String(describing: savedNumber))) are not equal")
    }
}
