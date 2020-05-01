//
//  AddPhotoService.swift
//  Instagram
//
//  Created by Alina Gomeniuc on 5/1/20.
//  Copyright © 2020 Alina Gomeniuc. All rights reserved.
//

import Foundation
import RxSwift

class AddPhotoService {
    
    func addPhoto(urlPhoto: String){
        let request = RequestService()
        let post = AddPostModel(url: urlPhoto)
        let subscription: Observable<Int> = request.post("https://eucc.me/alina/post",
                                                         parameters: post).observeOn(MainScheduler.instance);
        let _ = subscription.subscribe {event in
            debugPrint(event)
        }
    }
}
