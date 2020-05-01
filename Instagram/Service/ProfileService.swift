//
//  ProfilePostService.swift
//  Instagram
//
//  Created by Alina Gomeniuc on 5/1/20.
//  Copyright © 2020 Alina Gomeniuc. All rights reserved.
//

import Foundation
import RxSwift

class ProfileService {
    
    func fetchProfileFeedData() -> Observable<[PostModel]> {
           let req = RequestService()
           let url = URL(string: "https://eucc.me/alina/post")
           let urlR = URLRequest(url: url!)
           return req.get(urlR).observeOn(MainScheduler.instance);
       }
    
    func fetchProfileData() -> Observable<[ProfileModel]> {
        let req = RequestService()
        let url = URL(string: "https://eucc.me/alina/profile")
        let urlR = URLRequest(url: url!)
        return req.get(urlR).observeOn(MainScheduler.instance);
    }
    
    func updateProfileData(usernameText: String, bioText: String){
        let request = RequestService()
        let data = UpdateAllModel(username: usernameText, bio: bioText)
        let subscription: Observable<[Int]> = request.put("https://eucc.me/alina/profile/1",
                                                          parameters: data).observeOn(MainScheduler.instance);
        let _ = subscription.subscribe {event in debugPrint(event) }
    }
    
    func updateBioProfileData(bioText: String){
        let request = RequestService()
        let data = UpdateBioModel(bio: bioText)
        let subscription: Observable<Int> = request.put("https://eucc.me/alina/profile/1",
                                                        parameters: data).observeOn(MainScheduler.instance);
        let _ = subscription.subscribe {event in debugPrint(event) }
    }
    
    func updateUsernameProfileData(usernameText: String){
        let request = RequestService()
        let data = UpdateUsernameModel(username: usernameText)
        let subscription: Observable<Int> = request.put("https://eucc.me/alina/profile/1",
                                                        parameters: data).observeOn(MainScheduler.instance);
        let _ = subscription.subscribe {event in debugPrint(event) }
    }
    
}
