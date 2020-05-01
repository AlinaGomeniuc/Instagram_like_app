//
//  UserFeedCell.swift
//  Instagram
//
//  Created by Alina Gomeniuc on 4/2/20.
//  Copyright © 2020 Alina Gomeniuc. All rights reserved.
//

import UIKit

class UserFeedCell: UICollectionViewCell, UserFeedCellViewDelegate {

    @IBOutlet weak var likes: UILabel!
    @IBOutlet weak var comments: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var username: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func displayUsername(usernameText: String){
        username.text = usernameText
    }
    
    func displayComments(commentsText: String){
        comments.text = commentsText
    }

    func displayLikes(actionText: String){
        likes.text = actionText
    }

    func displayImage(imageData: Data){
        image.image = UIImage(data: imageData)
    }
}
