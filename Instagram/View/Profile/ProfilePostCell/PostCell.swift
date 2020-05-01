//
//  PostCell.swift
//  Instagram
//
//  Created by Alina Gomeniuc on 4/3/20.
//  Copyright © 2020 Alina Gomeniuc. All rights reserved.
//

import UIKit

class PostCell: UICollectionViewCell, ProfileFeedCellViewDelegate {

    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func displayImage(imageData: Data){
        imageView.image = UIImage(data: imageData)
    }
}
