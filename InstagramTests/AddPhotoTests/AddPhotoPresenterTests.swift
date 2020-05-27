//
//  AddPhotoPresenterTests.swift
//  InstagramTests
//
//  Created by Alina Gomeniuc on 5/27/20.
//  Copyright © 2020 Alina Gomeniuc. All rights reserved.
//

import XCTest
@testable import Instagram

class AddPhotoPresenterTests: XCTestCase {

    var addPhotoViewMock : AddPhotoViewMock!
    var addPhotoPresenter : AddPhotoPresenter!
    var addPhotoServiceMock : AddPhotoServiceMock!
    
    override func setUp() {
        super.setUp()
        self.addPhotoServiceMock = AddPhotoServiceMock()
        self.addPhotoPresenter = AddPhotoPresenter(addPhotoService: addPhotoServiceMock)
    }

    override func tearDown() {
        self.addPhotoViewMock = nil
        self.addPhotoPresenter = nil
        self.addPhotoServiceMock = nil
    }

    func testAddPostSuccess() {
        self.addPhotoViewMock = AddPhotoViewMock(url: "https://test")
        self.addPhotoPresenter.setViewDelegate(addPhotoViewDelegate: addPhotoViewMock)
        
        let expectation = self.expectation(description: "Adding post successfully")
        self.addPhotoServiceMock.expectation = expectation
        
        self.addPhotoPresenter.addUserPost()
        wait(for: [expectation], timeout: 2)
        
        XCTAssertTrue(addPhotoServiceMock!.addedPost)
        XCTAssertEqual(addPhotoViewMock.getUrl(), "https://test")
    }
    
    func testAddPostNoUrl() {
        self.addPhotoViewMock = AddPhotoViewMock()
        self.addPhotoPresenter.setViewDelegate(addPhotoViewDelegate: addPhotoViewMock)
   
        self.addPhotoPresenter.addUserPost()
        
        XCTAssertFalse(addPhotoServiceMock!.addedPost)
        XCTAssertEqual(addPhotoViewMock.getUrl(), "")
    }


}
