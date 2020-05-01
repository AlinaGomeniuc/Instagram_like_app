//
//  UpdateBioModel.swift
//  Instagram
//
//  Created by Alina Gomeniuc on 4/2/20.
//  Copyright © 2020 Alina Gomeniuc. All rights reserved.
//

import UIKit
struct UpdateBioModel: Codable {
   let bio: String
    
   init(bio: String) {
    self.bio = bio
    }
}
