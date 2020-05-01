//
//  FeedService.swift
//  Instagram
//
//  Created by Alina Gomeniuc on 5/1/20.
//  Copyright © 2020 Alina Gomeniuc. All rights reserved.
//

import Foundation
import RxSwift

class FeedService {
    
    func fetchFeedData() -> Observable<[GeneralFeedModel]> {
        let req = RequestService()
        let url = URL(string: "https://eucc.me/alina/general_feed")
        let urlR = URLRequest(url: url!);
        return req.get(urlR).observeOn(MainScheduler.instance);
    }
}
