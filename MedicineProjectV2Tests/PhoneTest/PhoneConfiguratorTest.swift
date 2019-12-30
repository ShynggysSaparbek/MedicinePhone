//
//  PhoneConfiguratorTest.swift
//  MedicineProjectV2Tests
//
//  Created by w2 on 8/20/19.
//  Copyright © 2019 w2. All rights reserved.
//

import XCTest
@testable import MedicineProjectV2

class PhoneConfiguratorTest: XCTestCase {
    var storyBoard: UIStoryboard!
    var vc: PhoneViewController!
    var presenter: PhonePresenterProtocol!
    
    override func setUp() {
        storyBoard = UIStoryboard(name: "Main", bundle: nil)
        vc = storyBoard.instantiateViewController(withIdentifier: String(describing: PhoneViewController.self)) as? PhoneViewController
        vc.configurator.configure(with: vc)
        presenter = vc.presenter
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testPresenterIsNotNilWhenConfiguratorConfigured(){
        XCTAssertNotNil(presenter, "Presenter is nil")
    }
    func testInteractorIsNotNilWhenConfiguratorConfigured(){
        XCTAssertNotNil(presenter.interactor, "Interactor is nil")
    }
    
    func testRouterIsNotNilWhenConfiguratorConfigured(){
        XCTAssertNotNil(presenter.router, "Router is nil")
    }
    

}
