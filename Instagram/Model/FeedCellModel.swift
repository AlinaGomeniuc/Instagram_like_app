//
//  FeedCellModel.swift
//  Instagram
//
//  Created by Alina Gomeniuc on 4/1/20.
//  Copyright © 2020 Alina Gomeniuc. All rights reserved.
//

import UIKit

class FeedCellModel {
    let id: String
    let image: Data
    
    init(id: String, image: Data) {
        self.id = id;
        self.image = image;
    }
}
