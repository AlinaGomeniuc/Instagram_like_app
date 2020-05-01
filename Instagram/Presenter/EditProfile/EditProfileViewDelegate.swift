//
//  EditProfileViewDelegate.swift
//  Instagram
//
//  Created by Alina Gomeniuc on 5/1/20.
//  Copyright © 2020 Alina Gomeniuc. All rights reserved.
//

import Foundation
protocol EditProfileViewDelegate: NSObjectProtocol, BaseViewDelegate{
    func getBio() -> String
    func getUsername() -> String
}
