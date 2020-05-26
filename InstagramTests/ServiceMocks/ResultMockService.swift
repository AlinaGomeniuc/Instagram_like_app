//
//  ResultMockService.swift
//  InstagramTests
//
//  Created by Alina Gomeniuc on 5/24/20.
//  Copyright © 2020 Alina Gomeniuc. All rights reserved.
//

@testable import Instagram

enum Result<T> {
    case success(payload: T)
    case failure(Error)
}
