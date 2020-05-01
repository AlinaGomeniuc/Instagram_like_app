//
//  AddPhotoPresenter.swift
//  Instagram
//
//  Created by Alina Gomeniuc on 4/30/20.
//  Copyright © 2020 Alina Gomeniuc. All rights reserved.
//

import Foundation

class AddPhotoPresenter {
    private let addPhotoService : AddPhotoService
    weak private var addPhotoViewDelegate : AddPhotoViewDelegate?
    
    init(addPhotoService : AddPhotoService){
        self.addPhotoService = addPhotoService
    }
    
    func setViewDelegate(addPhotoViewDelegate : AddPhotoViewDelegate?){
        self.addPhotoViewDelegate = addPhotoViewDelegate
    }
    
    func addUserPost(){
        addPhotoService.addPhoto(urlPhoto: (addPhotoViewDelegate?.getUrl())!)
    }
}
