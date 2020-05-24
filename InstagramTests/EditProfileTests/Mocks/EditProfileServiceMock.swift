//
//  EditProfileServiceMock.swift
//  InstagramTests
//
//  Created by Alina Gomeniuc on 5/23/20.
//  Copyright © 2020 Alina Gomeniuc. All rights reserved.
//

@testable import Instagram

class EditProfileServiceMock {
    
    var updatedAllInfo = false
    var updatedBioInfo = false
    var updatedUsernameInfo = false
}
    
extension EditProfileServiceMock : EditProfileServiceProtocol {
    func updateProfileData(usernameText: String, bioText: String){
        self.updatedAllInfo = true
    }

    func updateBioProfileData(bioText: String){
        self.updatedBioInfo = true
    }

    func updateUsernameProfileData(usernameText: String){
        self.updatedUsernameInfo = true
    }
}
