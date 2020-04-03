//
//  UpdateUsernameModel.swift
//  Instagram
//
//  Created by Alina Gomeniuc on 4/2/20.
//  Copyright © 2020 Alina Gomeniuc. All rights reserved.
//

import UIKit
struct UpdateUsernameModel: Codable {
   let username: String
    
   init(username: String) {
    self.username = username
    }
}
