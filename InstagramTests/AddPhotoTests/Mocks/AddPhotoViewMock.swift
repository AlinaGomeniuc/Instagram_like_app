//
//  AddPhotoViewMock.swift
//  InstagramTests
//
//  Created by Alina Gomeniuc on 5/27/20.
//  Copyright © 2020 Alina Gomeniuc. All rights reserved.
//

import Foundation
@testable import Instagram

class AddPhotoViewMock: NSObject, AddPhotoViewDelegate {
    var url: String
    
    init(url: String = ""){
        self.url = url
    }
  
    func showLoadingHUD() {}
    func hideLoadingHUD() {}
    
    func getUrl() -> String {
          return self.url
      }
    
    
}
