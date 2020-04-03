//
//  UserFeedCellModel.swift
//  Instagram
//
//  Created by Alina Gomeniuc on 4/2/20.
//  Copyright © 2020 Alina Gomeniuc. All rights reserved.
//

import UIKit
class UserFeedCellModel {
    let id: String
    let image: UIImage
    let postId: String
    let username: String
    let likes: String
    let comments: String
    
    init(id: String, image: UIImage, postId: String, username: String, likes: String, comments: String) {
        self.id = id;
        self.image = image;
        self.postId = postId;
        self.username = username;
        self.likes = likes;
        self.comments = comments;
    }
}

