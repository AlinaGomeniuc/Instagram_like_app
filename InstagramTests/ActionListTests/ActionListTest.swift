//
//  ActionListTest.swift
//  InstagramTests
//
//  Created by Alina Gomeniuc on 5/24/20.
//  Copyright © 2020 Alina Gomeniuc. All rights reserved.
//

import XCTest
import RxSwift
import RxCocoa
@testable import Instagram

class ActionListTest: XCTestCase {
    
    var actionViewMock : ActionViewMock!
    var actionPresenter : ActionPresenter!
    var actionServiceMock : ActionServiceMock!
    
    override func setUp() {
        super.setUp()
        self.actionViewMock = ActionViewMock()
    }

    override func tearDown() {
        self.actionViewMock = nil
    }

    func testActionDataAvailable() {
        let user1 = ActionModel(id: "1",
                               username: "user1",
                               action: "action1")

        let user2 = ActionModel(id: "2",
                               username: "user2",
                               action: "action2")
        
        let expectation = self.expectation(description: "Getting action data successfully")
        
        self.actionServiceMock = ActionServiceMock(actions: [user1, user2])
        self.actionPresenter = ActionPresenter(actionService: actionServiceMock)
        
        self.actionPresenter.setViewDelegate(actionViewDelegate: actionViewMock)
        self.actionServiceMock.isSuccesful = true
        self.actionViewMock.expectation = expectation

        self.actionPresenter.fetchActionData()
        wait(for: [expectation], timeout: 2)

        XCTAssertTrue(actionViewMock.hasComplitedRequest)
        XCTAssertEqual(actionPresenter.nrOfActions, 2)
        XCTAssertEqual(actionPresenter.actionData[0].username, "user1")
        XCTAssertEqual(actionPresenter.actionData[1].username, "user2")
        XCTAssertEqual(actionPresenter.actionData[0].action, "action1")
        XCTAssertEqual(actionPresenter.actionData[1].action, "action2")
    }
    
    func testActionNoDataAvailable() {
        self.actionServiceMock = ActionServiceMock(actions: [])
        self.actionPresenter = ActionPresenter(actionService: actionServiceMock)
        
        let expectation = self.expectation(description: "Getting none action data")
        
        self.actionPresenter.setViewDelegate(actionViewDelegate: actionViewMock)
        self.actionServiceMock.isSuccesful = true
        self.actionViewMock.expectation = expectation
        
        self.actionPresenter.fetchActionData()
        wait(for: [expectation], timeout: 2)
        
        XCTAssertTrue(actionViewMock.hasComplitedRequest)
        XCTAssertEqual(actionPresenter.nrOfActions, 0)
    }
    
    func testActionErrorRequest() {
        self.actionServiceMock = ActionServiceMock(actions: [])
        self.actionPresenter = ActionPresenter(actionService: actionServiceMock)
        
        self.actionPresenter.setViewDelegate(actionViewDelegate: actionViewMock)
        self.actionPresenter.fetchActionData()
        
        XCTAssertFalse(actionViewMock.hasComplitedRequest)
        XCTAssertEqual(actionPresenter.nrOfActions, 0)
    }
    
    func testConfigureActionCellWithData() {
        let actionCellMock = ActionCellMock()
        
        let user = ActionModel(id: "1",
                               username: "user1",
                               action: "action1")
        
        self.actionServiceMock = ActionServiceMock(actions: [])
        self.actionPresenter = ActionPresenter(actionService: actionServiceMock)
        self.actionPresenter.actionData = [user]
        
        self.actionPresenter.configureCell(cell: actionCellMock, forRow: 0)
        
        XCTAssertEqual(actionPresenter.nrOfActions, 1)
        XCTAssertEqual(actionCellMock.action, "action1")
        XCTAssertEqual(actionCellMock.username, "user1")
    }
    
    func testConfigureActionCellWithNoData() {
        let actionCellMock = ActionCellMock()
        
        self.actionServiceMock = ActionServiceMock(actions: [])
        self.actionPresenter = ActionPresenter(actionService: actionServiceMock)
        self.actionPresenter.actionData = []
        
        self.actionPresenter.configureCell(cell: actionCellMock, forRow: 0)
        
        XCTAssertEqual(actionPresenter.nrOfActions, 0)
        XCTAssertNil(actionCellMock.action)
        XCTAssertNil(actionCellMock.username)
    }


}
