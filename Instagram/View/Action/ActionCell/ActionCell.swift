//
//  ActionCell.swift
//  Instagram
//
//  Created by Alina Gomeniuc on 3/2/20.
//  Copyright © 2020 Alina Gomeniuc. All rights reserved.
//

import UIKit

class ActionCell: UICollectionViewCell, ActionCellViewDelegate{

    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var action: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func displayUsername(usernameText: String){
        username.text = usernameText
    }
    
    func displayAction(actionText: String){
        action.text = actionText
    }

}
