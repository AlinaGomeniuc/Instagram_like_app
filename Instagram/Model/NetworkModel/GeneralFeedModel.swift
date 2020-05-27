//
//  GeneralFeed.swift
//  Instagram
//
//  Created by Alina Gomeniuc on 4/1/20.
//  Copyright © 2020 Alina Gomeniuc. All rights reserved.
//

struct GeneralFeedModel: Codable {
   let id: String
   let url: String
    
    init(id: String, url: String) {
        self.id = id
        self.url = url
    }
}
