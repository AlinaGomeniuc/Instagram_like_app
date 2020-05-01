//
//  HomeService.swift
//  Instagram
//
//  Created by Alina Gomeniuc on 4/30/20.
//  Copyright © 2020 Alina Gomeniuc. All rights reserved.
//

import RxSwift

class UserFeedService {
    
    func fetchUserFeedData() -> Observable<[FeedModel]> {
        let req = RequestService()
        let url = URL(string: "https://eucc.me/alina/feed")
        let urlR = URLRequest(url: url!);
        return req.get(urlR).observeOn(MainScheduler.instance);
    }
}

