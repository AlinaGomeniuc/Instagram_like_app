//
//  ProfileUITests.swift
//  InstagramUITests
//
//  Created by Alina Gomeniuc on 5/30/20.
//  Copyright © 2020 Alina Gomeniuc. All rights reserved.
//

import XCTest

class ProfileUITests: XCTestCase {
    let app = XCUIApplication()

    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testEditBioView() {
        app.tabBars.buttons["person"].tap()
        
        let editProfileButton = app/*@START_MENU_TOKEN@*/.staticTexts["Edit profile"]/*[[".buttons[\"Edit profile\"].staticTexts[\"Edit profile\"]",".staticTexts[\"Edit profile\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let refresh = app.buttons["arrow.clockwise"]

        XCTAssertTrue(editProfileButton.exists)
        XCTAssertTrue(refresh.exists)
        
        editProfileButton.tap()
        
        let bioText = "I love playing outside"
        let bioField = app.textFields["Bio"]
        let doneButton = app/*@START_MENU_TOKEN@*/.staticTexts["Done"]/*[[".buttons[\"Done\"].staticTexts[\"Done\"]",".staticTexts[\"Done\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        XCTAssertTrue(bioField.exists)
        XCTAssertTrue(doneButton.exists)
        
        bioField.tap()
        bioField.typeText(bioText)

        app.swipeDown()
        doneButton.tap()
        refresh.tap()
        
        XCTAssertTrue(app.staticTexts[bioText].exists)
    }
    
    func testEditUsernameView() {
        app.tabBars.buttons["person"].tap()
        
        let editProfileButton = app/*@START_MENU_TOKEN@*/.staticTexts["Edit profile"]/*[[".buttons[\"Edit profile\"].staticTexts[\"Edit profile\"]",".staticTexts[\"Edit profile\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let refresh = app.buttons["arrow.clockwise"]

        XCTAssertTrue(editProfileButton.exists)
        XCTAssertTrue(refresh.exists)
        
        editProfileButton.tap()
        
        let usernameText = "dog_user"
        let usernameField = app.textFields["Username"]

        let doneButton = app/*@START_MENU_TOKEN@*/.staticTexts["Done"]/*[[".buttons[\"Done\"].staticTexts[\"Done\"]",".staticTexts[\"Done\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        XCTAssertTrue(usernameField.exists)
        XCTAssertTrue(doneButton.exists)
        
        usernameField.tap()
        usernameField.typeText(usernameText)
        
        app.swipeDown()
        doneButton.tap()
        refresh.tap()
        
        let username = app.navigationBars[usernameText].staticTexts[usernameText]
        
        XCTAssertTrue(username.exists)
    }
    
    func testLoadProfileView() {
        app.tabBars.buttons["person"].tap()
        
        let username = app.navigationBars["dog_user"].staticTexts["dog_user"]
        let bio = app.staticTexts["I love playing outside"]
        let nrOfPosts = app.staticTexts["9"]
        let nrOfFollowers = app.staticTexts["123"]
        let nrOfFollowing = app.staticTexts["40"]
        let profileFeed = app.collectionViews
        profileFeed.element.swipeUp()
        
        XCTAssertTrue(profileFeed.element.exists)
        XCTAssertEqual(profileFeed.element.cells.count, 12)
        
        XCTAssertTrue(username.exists)
        XCTAssertTrue(bio.exists)
        XCTAssertTrue(nrOfFollowers.exists)
        XCTAssertTrue(nrOfFollowing.exists)
        XCTAssertTrue(nrOfPosts.exists)
    }

    func testEditAllProfileDataView() {
        app.tabBars.buttons["person"].tap()

        let editProfileButton = app/*@START_MENU_TOKEN@*/.staticTexts["Edit profile"]/*[[".buttons[\"Edit profile\"].staticTexts[\"Edit profile\"]",".staticTexts[\"Edit profile\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let refresh = app.buttons["arrow.clockwise"]

        XCTAssertTrue(editProfileButton.exists)
        XCTAssertTrue(refresh.exists)

        editProfileButton.tap()

        let usernameText = "dog_user"
        let usernameField = app.textFields["Username"]

        let bioText = "I love playing outside"
        let bioField = app.textFields["Bio"]

        let doneButton = app/*@START_MENU_TOKEN@*/.staticTexts["Done"]/*[[".buttons[\"Done\"].staticTexts[\"Done\"]",".staticTexts[\"Done\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/

        XCTAssertTrue(usernameField.exists)
        XCTAssertTrue(bioField.exists)
        XCTAssertTrue(doneButton.exists)

        usernameField.tap()
        usernameField.typeText(usernameText)

        bioField.tap()
        bioField.typeText(bioText)

        app.swipeDown()
        doneButton.tap()
        refresh.tap()

        let username = app.navigationBars[usernameText].staticTexts[usernameText]

        XCTAssertTrue(username.exists)
        XCTAssertTrue(app.staticTexts[bioText].exists)
    }
}
