//
//  FeedCell.swift
//  Instagram
//
//  Created by Alina Gomeniuc on 2/27/20.
//  Copyright © 2020 Alina Gomeniuc. All rights reserved.
//

import UIKit

class FeedCell: UICollectionViewCell, FeedCellViewDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func displayImage(imageData: Data){
        imageView.image = UIImage(data: imageData)
    }
}
