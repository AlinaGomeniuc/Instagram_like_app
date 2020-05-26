//
//  EditProfileServiceMock.swift
//  InstagramTests
//
//  Created by Alina Gomeniuc on 5/23/20.
//  Copyright © 2020 Alina Gomeniuc. All rights reserved.
//

import XCTest
@testable import Instagram

class EditProfileServiceMock {
    
    var updatedAllInfo = false
    var updatedBioInfo = false
    var updatedUsernameInfo = false
    var expectation : XCTestExpectation!
}
    
extension EditProfileServiceMock : EditProfileServiceProtocol {
    func updateProfileData(usernameText: String, bioText: String){
        self.updatedAllInfo = true
        self.expectation.fulfill()
    }

    func updateBioProfileData(bioText: String){
        self.updatedBioInfo = true
        self.expectation.fulfill()
    }

    func updateUsernameProfileData(usernameText: String){
        self.updatedUsernameInfo = true
        self.expectation.fulfill()
    }
}
