//
//  UpdateAllModel.swift
//  Instagram
//
//  Created by Alina Gomeniuc on 4/2/20.
//  Copyright © 2020 Alina Gomeniuc. All rights reserved.
//

import UIKit
struct UpdateAllModel: Codable {
   let username: String
    let bio: String
    
    init(username: String, bio: String) {
    self.username = username
    self.bio = bio
    }
}
