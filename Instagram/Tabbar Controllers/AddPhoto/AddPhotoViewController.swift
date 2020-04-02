//
//  AddPhotoViewController.swift
//  Instagram
//
//  Created by Alina Gomeniuc on 3/2/20.
//  Copyright © 2020 Alina Gomeniuc. All rights reserved.
//

import UIKit
class AddPhotoViewController: UIViewController {
    
    @IBOutlet weak var urlText: UITextField!
    
    @IBAction func addPhoto(_ sender: Any) {
        urlText.text = ""

    }
}
