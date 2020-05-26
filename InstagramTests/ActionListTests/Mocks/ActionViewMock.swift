//
//  ActionViewMock.swift
//  InstagramTests
//
//  Created by Alina Gomeniuc on 5/24/20.
//  Copyright © 2020 Alina Gomeniuc. All rights reserved.
//

import Foundation
import XCTest
@testable import Instagram

class ActionViewMock: NSObject, ActionViewDelegate {
    
    var hasComplitedRequest = false

    var expectation : XCTestExpectation!
   
    func showLoadingHUD() {}

    func hideLoadingHUD() {}
    
    func refrashActionView() {
        self.hasComplitedRequest = true
        self.expectation.fulfill()
    }
}
