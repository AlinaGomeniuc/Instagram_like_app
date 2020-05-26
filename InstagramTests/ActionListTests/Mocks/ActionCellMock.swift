//
//  ActionCellMock.swift
//  InstagramTests
//
//  Created by Alina Gomeniuc on 5/26/20.
//  Copyright © 2020 Alina Gomeniuc. All rights reserved.
//

import Foundation
@testable import Instagram

class ActionCellMock: ActionCellViewDelegate {
    
    var action: String!
    var username: String!
    
    func displayUsername(usernameText: String) {
        self.username = usernameText
    }
    
    func displayAction(actionText: String) {
        self.action = actionText
    }
    
    
}
