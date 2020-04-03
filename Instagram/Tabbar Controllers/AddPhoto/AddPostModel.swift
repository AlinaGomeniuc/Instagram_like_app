//
//  AddPostModel.swift
//  Instagram
//
//  Created by Alina Gomeniuc on 4/2/20.
//  Copyright © 2020 Alina Gomeniuc. All rights reserved.
//

import UIKit
struct AddPostModel: Codable {
   let url: String
    
   init(url: String) {
    self.url = url
    
    }
}
