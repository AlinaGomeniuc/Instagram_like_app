//
//  EditProfilePresenter.swift
//  InstagramTests
//
//  Created by Alina Gomeniuc on 5/21/20.
//  Copyright © 2020 Alina Gomeniuc. All rights reserved.
//

import XCTest
@testable import Instagram

class EditProfilePresenterTest: XCTestCase {
    
    var editProfileViewMock : EditProfileViewMock!
    var editProfilePresenter : EditProfilePresenter!
    var editProfileServiceMock : EditProfileServiceMock!

    override func setUp() {
          super.setUp()
          self.editProfileServiceMock = EditProfileServiceMock()
          self.editProfilePresenter = EditProfilePresenter(profileService: editProfileServiceMock)
    }

    override func tearDown() {
        editProfilePresenter = nil
        editProfileViewMock = nil
        editProfileServiceMock = nil
        super.tearDown()
    }

    func testEditBioData() {
        self.editProfileViewMock = EditProfileViewMock(bio: "Test Bio")
        self.editProfilePresenter.setViewDelegate(editProfileViewDelegate: editProfileViewMock)
        
        let expectation = self.expectation(description: "Editing bio data successfully")
        self.editProfileServiceMock.expectation = expectation
        
        self.editProfilePresenter.editProfileData()
        wait(for: [expectation], timeout: 2)
        
        XCTAssertTrue(editProfileServiceMock!.updatedBioInfo)
        XCTAssertFalse(editProfileServiceMock!.updatedAllInfo)
        XCTAssertFalse(editProfileServiceMock!.updatedUsernameInfo)
        
        XCTAssertEqual(editProfileViewMock.getBio(), "Test Bio")
        XCTAssertEqual(editProfileViewMock.getUsername(), "")
    }
    
    func testEditUsernameData() {
        self.editProfileViewMock = EditProfileViewMock(username: "Test Username")
        self.editProfilePresenter.setViewDelegate(editProfileViewDelegate: editProfileViewMock)
        
        let expectation = self.expectation(description: "Editing username data successfully")
        self.editProfileServiceMock.expectation = expectation
        
        self.editProfilePresenter.editProfileData()
        wait(for: [expectation], timeout: 2)
        
        XCTAssertTrue(editProfileServiceMock!.updatedUsernameInfo)
        XCTAssertFalse(editProfileServiceMock!.updatedBioInfo)
        XCTAssertFalse(editProfileServiceMock!.updatedAllInfo)

        XCTAssertEqual(editProfileViewMock.getUsername(), "Test Username")
        XCTAssertEqual(editProfileViewMock.getBio(), "")
    }
    
    func testEditAllData() {
        self.editProfileViewMock = EditProfileViewMock(bio: "Test Bio", username: "Test Username")
        self.editProfilePresenter.setViewDelegate(editProfileViewDelegate: editProfileViewMock)
        
        let expectation = self.expectation(description: "Editing all data successfully")
        self.editProfileServiceMock.expectation = expectation
        
        self.editProfilePresenter.editProfileData()
        wait(for: [expectation], timeout: 2)
        
        XCTAssertTrue(editProfileServiceMock!.updatedAllInfo)
        XCTAssertFalse(editProfileServiceMock!.updatedUsernameInfo)
        XCTAssertFalse(editProfileServiceMock!.updatedBioInfo)

        XCTAssertEqual(editProfileViewMock.getUsername(), "Test Username")
        XCTAssertEqual(editProfileViewMock.getBio(), "Test Bio")
    }
    
    func testEditNoData() {
        self.editProfileViewMock = EditProfileViewMock()
        self.editProfilePresenter.setViewDelegate(editProfileViewDelegate: editProfileViewMock)
        self.editProfilePresenter.editProfileData()
        
        XCTAssertFalse(editProfileServiceMock!.updatedAllInfo)
        XCTAssertFalse(editProfileServiceMock!.updatedUsernameInfo)
        XCTAssertFalse(editProfileServiceMock!.updatedBioInfo)

        XCTAssertEqual(editProfileViewMock.getUsername(), "")
        XCTAssertEqual(editProfileViewMock.getBio(), "")
    }

}
