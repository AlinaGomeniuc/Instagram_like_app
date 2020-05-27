//
//  AddPhotoPresenter.swift
//  Instagram
//
//  Created by Alina Gomeniuc on 4/30/20.
//  Copyright © 2020 Alina Gomeniuc. All rights reserved.
//

import Foundation

class AddPhotoPresenter {
    private let addPhotoService : AddPhotoServiceProtocol
    weak private var addPhotoViewDelegate : AddPhotoViewDelegate?
    
    init(addPhotoService : AddPhotoServiceProtocol){
        self.addPhotoService = addPhotoService
    }
    
    func setViewDelegate(addPhotoViewDelegate : AddPhotoViewDelegate?){
        self.addPhotoViewDelegate = addPhotoViewDelegate
    }
    
    func addUserPost(){
        if (!(addPhotoViewDelegate?.getUrl().isEmpty)!){
           addPhotoService.addPhoto(urlPhoto: (addPhotoViewDelegate?.getUrl())!)
        }
    }
}
