//
//  EditProfilePresenter.swift
//  Instagram
//
//  Created by Alina Gomeniuc on 5/1/20.
//  Copyright © 2020 Alina Gomeniuc. All rights reserved.
//

import Foundation
import RxSwift

class EditProfilePresenter {
    private let profileService : ProfileService
    weak private var editProfileViewDelegate : EditProfileViewDelegate?

    init(profileService : ProfileService){
        self.profileService = profileService
    }

    func setViewDelegate(editProfileViewDelegate : EditProfileViewDelegate?){
        self.editProfileViewDelegate = editProfileViewDelegate
    }
    
    func editProfileData(){
        let bio = editProfileViewDelegate?.getBio()
        let username = editProfileViewDelegate?.getUsername()
        if(!bio!.isEmpty){
            if(!username!.isEmpty){
                profileService.updateProfileData(usernameText: username!, bioText: bio!)
            } else {
                profileService.updateBioProfileData(bioText: bio!)
            }
        }
        if (!username!.isEmpty && !bio!.isEmpty){
            profileService.updateUsernameProfileData(usernameText: username!)
            }
        }
}
