//
//  ActionViewController.swift
//  Instagram
//
//  Created by Alina Gomeniuc on 4/1/20.
//  Copyright © 2020 Alina Gomeniuc. All rights reserved.
//

import UIKit
import MBProgressHUD

class ActionViewController: UIViewController, ActionViewDelegate {
    
    // MARK: Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let actionPresenter = ActionPresenter(actionService: ActionService())
    
    // MARK: Properties
    let cellIdentifier = "ActionCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        actionPresenter.setViewDelegate(actionViewDelegate: self)
        
        let bundle = Bundle.init(for: ActionCell.self)
        let nib = UINib(nibName: "ActionCell", bundle: bundle)
        collectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
        
        actionPresenter.fetchActionData()
       }
    
    func showLoadingHUD() {
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.label.text = "Loading..."
    }

    func hideLoadingHUD() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    func refrashActionView() {
        collectionView.reloadData()
    }
}

extension ActionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return actionPresenter.nrOfActions
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        
        guard let actionCell = cell as? ActionCell else { return UICollectionViewCell()}
        actionPresenter.configureCell(cell: actionCell, forRow: indexPath.row)
        return actionCell
    }
}

