//
//  request.swift
//  Instagram
//
//  Created by Alina Gomeniuc on 4/1/20.
//  Copyright © 2020 Alina Gomeniuc. All rights reserved.
//

import Alamofire
import RxSwift

class RequestService {

    func get<T: Codable>(_ urlConvertible: URLRequestConvertible) -> Observable<T> {
        return Observable<T>.create { observer in
            let request = AF.request(urlConvertible).responseDecodable { (response: DataResponse<T, AFError>) in
                switch response.result {
                case .success(let value):
                    observer.onNext(value)
                    observer.onCompleted()
                case .failure(let error):
                    observer.onError(error)
                }
            }
            
            return Disposables.create {
                request.cancel()
            }
        }
    }
    
    func post<T: Codable ,Y: Codable>(_ urlConvertible: URLConvertible, parameters: T) -> Observable<Y> {
        return Observable<Y>.create { observer in
            let request = AF.request(urlConvertible, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default).responseDecodable { (response: DataResponse<Y, AFError>) in
                switch response.result {
                case .success(let value):
                    observer.onNext(value)
                    observer.onCompleted()
                case .failure(let error):
                    observer.onError(error)
                }            }
            
            return Disposables.create {
                request.cancel()
            }
        }
    }
    
    func put<T: Codable ,Y: Codable>(_ urlConvertible: URLConvertible, parameters: T) -> Observable<Y> {
        return Observable<Y>.create { observer in
            let request = AF.request(urlConvertible, method: .put, parameters: parameters, encoder: JSONParameterEncoder.default).responseDecodable { (response: DataResponse<Y, AFError>) in
                switch response.result {
                case .success(let value):
                    observer.onNext(value)
                    observer.onCompleted()
                case .failure(let error):
                    observer.onError(error)
                }            }
            
            return Disposables.create {
                request.cancel()
            }
        }
    }
}
