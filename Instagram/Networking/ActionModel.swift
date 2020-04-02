//
//  ActionModel.swift
//  Instagram
//
//  Created by Alina Gomeniuc on 4/1/20.
//  Copyright © 2020 Alina Gomeniuc. All rights reserved.
//

import UIKit

struct ActionModel: Codable {
   let id: String
   let username: String
   let action: String


init(id: String, username: String, action: String) {
    self.id = id
    self.username = username
    self.action = action
}
}
