//
//  ActionService.swift
//  Instagram
//
//  Created by Alina Gomeniuc on 4/30/20.
//  Copyright © 2020 Alina Gomeniuc. All rights reserved.
//

import RxSwift

protocol ActionServiceProtocol {
    func fetchActionList() -> Observable<[ActionModel]>
}

class ActionService: ActionServiceProtocol {
    
    func fetchActionList() -> Observable<[ActionModel]>{
        let req = RequestService()
        let url = URL(string: "https://eucc.me/alina/actions")
        let urlR = URLRequest(url: url!);
        return req.get(urlR).observeOn(MainScheduler.instance);
    }
}
