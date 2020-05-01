//
//  UserFeedCellViewDelegate.swift
//  Instagram
//
//  Created by Alina Gomeniuc on 5/1/20.
//  Copyright © 2020 Alina Gomeniuc. All rights reserved.
//
import Foundation

protocol UserFeedCellViewDelegate {
    func displayComments(commentsText: String)
    func displayLikes(actionText: String)
    func displayUsername(usernameText: String)
    func displayImage(imageData: Data)
}
