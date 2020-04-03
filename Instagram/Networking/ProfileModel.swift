//
//  ProfileModel.swift
//  Instagram
//
//  Created by Alina Gomeniuc on 4/1/20.
//  Copyright © 2020 Alina Gomeniuc. All rights reserved.
//

import UIKit
struct ProfileModel: Codable {
   let id: String
   let username: String
   let bio: String
   let posts: String
   let followers: String
   let following: String
    
//    init(id: String, username: String, bio: String, posts: String, followers: String, following: String) {
//        self.id = id
//        self.username = username
//        self.bio = bio
//        self.posts = posts
//        self.followers = followers
//        self.following = following
//    }
}
