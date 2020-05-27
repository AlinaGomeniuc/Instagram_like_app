//
//  FeedViewMock.swift
//  InstagramTests
//
//  Created by Alina Gomeniuc on 5/26/20.
//  Copyright © 2020 Alina Gomeniuc. All rights reserved.
//

import Foundation
import XCTest
@testable import Instagram

class FeedViewMock: NSObject, FeedViewDelegate {
    var hasComplitedRequest = false
    var expectation : XCTestExpectation!
    
    func showLoadingHUD() {}
    
    func hideLoadingHUD() {}
    
    func refrashFeedView() {
        self.hasComplitedRequest = true
        self.expectation.fulfill()
    }
    
    
}
