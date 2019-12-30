//
//  PhonePresenterTest.swift
//  MedicineProjectV2Tests
//
//  Created by w2 on 8/20/19.
//  Copyright © 2019 w2. All rights reserved.
//

import XCTest
@testable import MedicineProjectV2

class PhonePresenterTest: XCTestCase {
    var storyBoard: UIStoryboard!
    var vc: PhoneViewController!
    var presenter: PhonePresenterProtocol!
    
    override func setUp() {
        storyBoard = UIStoryboard(name: "Main", bundle: nil)
        vc = storyBoard.instantiateViewController(withIdentifier: String(describing: PhoneViewController.self)) as? PhoneViewController
        vc.loadViewIfNeeded()
        
        presenter = vc.presenter
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPhoneNumberChangedWhenPresenterChangedIt(){
        let number = "8(701) 700 2000"
        presenter.setPhone(with: number)
        let savedNumber = presenter.getPhoneNumber()
        XCTAssertEqual(savedNumber, number, "Saved number(\(String(describing: savedNumber))) and original number(\(number)) are not equal")
    }
    
    
}
