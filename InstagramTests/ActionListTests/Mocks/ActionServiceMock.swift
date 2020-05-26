//
//  ActionServiceMock.swift
//  InstagramTests
//
//  Created by Alina Gomeniuc on 5/24/20.
//  Copyright © 2020 Alina Gomeniuc. All rights reserved.
//

import RxSwift
@testable import Instagram

class ActionServiceMock: ActionServiceProtocol {
    
    private let actions: [ActionModel]
    var request: RequestMock<ActionModel>!
    var isSuccesful = false
    
    init(actions: [ActionModel]) {
        self.actions = actions
    }
  
    func fetchActionList() -> Observable<[ActionModel]> {
        request = RequestMock()
        if (isSuccesful){
            request.result = .success(payload: actions)
        } else {
            let error: Error = RequestFailureReason.notFound
            request.result = .failure(error)
        }
        return request.get().observeOn(MainScheduler.instance);
    }
}
       
