//
//  AddPhotoViewController.swift
//  Instagram
//
//  Created by Alina Gomeniuc on 4/1/20.
//  Copyright © 2020 Alina Gomeniuc. All rights reserved.
//

import UIKit
import RxSwift
class AddPhotoViewController: UIViewController {
    
    @IBOutlet weak var urlText: UITextField!
    
    @IBAction func addPhoto(_ sender: Any) {
        addUserPost()
        urlText.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func addUserPost(){
        let request = RequestService()
        let post = AddPostModel(url: urlText.text!)
        let subscription: Observable<Int> = request.post("https://eucc.me/alina/post", parameters: post).observeOn(MainScheduler.instance);
        let _ = subscription.subscribe {event in
            debugPrint(event)
        }
    }
}
