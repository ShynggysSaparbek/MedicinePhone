//
//  ProfileImageSavingTest.swift
//  MedicineProjectV2Tests
//
//  Created by w2 on 8/14/19.
//  Copyright © 2019 w2. All rights reserved.
//

import XCTest
@testable import MedicineProjectV2

class ProfileSavingTest: XCTestCase{
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    
    func testProfileImageDataSaved(){
        // given:
        ProfileImageManager.delete()
        guard let image = UIImage(named: "Zere") else { return }
        let profileImage = ProfileImageStructure(uiImage: image)
        // when:
        ProfileImageManager.set(structure: profileImage)
        let savedImage = ProfileImageManager.get()
        //then
        XCTAssert(savedImage?.data == profileImage.data, "Profile Image is not saved")
    }
    
    func testProfileImageNumberDeleted(){
        // given:
        guard let image = UIImage(named: "Zere") else { return }
        let profileImage = ProfileImageStructure(uiImage: image)
        
        // when:
        ProfileImageManager.set(structure: profileImage)
        ProfileImageManager.delete()
        let savedImage = ProfileImageManager.get()
        // then:
        XCTAssertNil(savedImage, "Profile Image is not deleted")
    }
    
    func testProfileIageWasChanged(){
        // given:
        guard let oldImage = UIImage(named: "Zere") else { return }
        let oldProfileImage = ProfileImageStructure(uiImage: oldImage)
        
        guard let newImage = UIImage(named: "Dula") else { return }
        let newProfileImage = ProfileImageStructure(uiImage: newImage)
        
        // when:
        ProfileImageManager.set(structure: oldProfileImage)
        ProfileImageManager.set(structure: newProfileImage)
        // then:
        let profileImage = ProfileImageManager.get()
        XCTAssertTrue(profileImage?.data == newProfileImage.data)
    }
    func testIsRegistred(){
        // given:
        guard let image = UIImage(named: "Zere") else { return }
        let profileImage = ProfileImageStructure(uiImage: image)
        
        // when:
        ProfileImageManager.set(structure: profileImage)
        // then:
        XCTAssertTrue(ProfileImageManager.isRegistred())
        ProfileImageManager.delete()
        XCTAssertFalse(ProfileImageManager.isRegistred())
    }
}

