//
//  File.swift
//  InstagramTests
//
//  Created by Alina Gomeniuc on 5/23/20.
//  Copyright © 2020 Alina Gomeniuc. All rights reserved.
//

import Foundation
@testable import Instagram

class EditProfileViewMock: NSObject, EditProfileViewDelegate {

    var bio: String
    var username: String
    
    init(bio: String = "", username: String = ""){
        self.bio = bio
        self.username = username
    }
    
    func showLoadingHUD() {}

    func hideLoadingHUD() {}
    
    func getBio() -> String{
        return self.bio
    }
    
    func getUsername() -> String{
        return self.username
    }
}
