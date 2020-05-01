//
//  AddPhotoViewController.swift
//  Instagram
//
//  Created by Alina Gomeniuc on 4/1/20.
//  Copyright © 2020 Alina Gomeniuc. All rights reserved.
//

import UIKit
import RxSwift
import MBProgressHUD

class AddPhotoViewController: UIViewController, AddPhotoViewDelegate {
    
    @IBOutlet weak var urlText: UITextField!
    
    private let addPhotoPresenter = AddPhotoPresenter(addPhotoService: AddPhotoService())
    
    @IBAction func addPhoto(_ sender: Any) {
        addPhotoPresenter.addUserPost()
        urlText.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addPhotoPresenter.setViewDelegate(addPhotoViewDelegate: self)
    }
    
    func showLoadingHUD() {
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.label.text = "Loading..."
    }

    func hideLoadingHUD() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    func getUrl() -> String {
        return self.urlText.text ?? ""
    }
}
