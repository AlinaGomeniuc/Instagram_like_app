//
//  RequestMock.swift
//  InstagramTests
//
//  Created by Alina Gomeniuc on 5/25/20.
//  Copyright © 2020 Alina Gomeniuc. All rights reserved.
//

import RxSwift


class RequestMock<T> {
    var result: Result<[T]>!
    
    func get<T>() -> Observable<T> {
         return Observable.create { observer in
                   switch self.result {
                           case .success(let value):
                               observer.onNext(value as! T)
                               observer.onCompleted()
                           case .failure(let error):
                               observer.onError(error)
                           case .none:
                                self.result = nil
                    }
        return Disposables.create() {}
        }
    }
}
