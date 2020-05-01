//
//  ProfileFeedView.swift
//  Instagram
//
//  Created by Alina Gomeniuc on 5/1/20.
//  Copyright © 2020 Alina Gomeniuc. All rights reserved.
//

import Foundation
protocol ProfileFeedViewDelegate: NSObjectProtocol, BaseViewDelegate{
    func refrashProfileFeedView()
    func setPostNr(postNr: String)
    func setFolowersNr(folowersNr: String)
    func setFolowingNr(folowingNr: String)
    func setBio(bioInfo: String)
    func setUsername(username: String)
}
