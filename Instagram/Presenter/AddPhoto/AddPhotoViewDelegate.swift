//
//  AddPhotoViewDelegate.swift
//  Instagram
//
//  Created by Alina Gomeniuc on 5/1/20.
//  Copyright © 2020 Alina Gomeniuc. All rights reserved.
//

import Foundation

protocol AddPhotoViewDelegate: NSObjectProtocol, BaseViewDelegate {
    func getUrl() -> String
}
