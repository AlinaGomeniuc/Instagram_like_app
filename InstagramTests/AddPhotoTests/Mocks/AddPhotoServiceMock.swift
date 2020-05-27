//
//  AddPhotoServiceMock.swift
//  InstagramTests
//
//  Created by Alina Gomeniuc on 5/27/20.
//  Copyright © 2020 Alina Gomeniuc. All rights reserved.
//

import Foundation
import XCTest
@testable import Instagram

class AddPhotoServiceMock: AddPhotoServiceProtocol {
    var addedPost = false
    var expectation : XCTestExpectation!
    
    func addPhoto(urlPhoto: String){
        self.addedPost = true
        self.expectation.fulfill()
    }
    
}
