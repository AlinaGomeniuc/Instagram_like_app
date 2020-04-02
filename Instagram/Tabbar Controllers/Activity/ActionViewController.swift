//
//  ActionViewController.swift
//  Instagram
//
//  Created by Alina Gomeniuc on 4/1/20.
//  Copyright © 2020 Alina Gomeniuc. All rights reserved.
//

import UIKit
import RxSwift
import MBProgressHUD

class ActionViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: Properties
    let cellIdentifier = "ActionCell"
    var dataSource: Array<ActionModel> = Array()
    
    override func viewDidLoad() {
           super.viewDidLoad()
           let bundle = Bundle.init(for: ActionCell.self)
           let nib = UINib(nibName: "ActionCell", bundle: bundle)
           collectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
        
           fetchData()
       }

    private func fetchData(){
            showLoadingHUD()
            let req = RequestService()
            let url = URL(string: "https://eucc.me/alina/actions")
            let urlR = URLRequest(url: url!);
            let subscription: Observable<[ActionModel]> = req.get(urlR).observeOn(MainScheduler.instance);
            let _ = subscription.subscribe {event in
                var action : [ActionModel];
                switch event {
                case .next(let value):
                    action = value
                    for element in action {
                        let cell = ActionModel(id: element.id,
                                               username: element.username,
                                               action: element.action)
                        
                        self.dataSource.append(cell)
            }
                case .error(let error):
                     print(error)
    
                case .completed:
                    self.hideLoadingHUD()
                    self.collectionView.reloadData()
    
                }
            }
        }
    
    
    private func showLoadingHUD() {
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.label.text = "Loading..."
    }

    private func hideLoadingHUD() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
}

extension ActionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset = 10
        return UIEdgeInsets(top: CGFloat(inset), left: CGFloat(inset), bottom: CGFloat(inset), right: CGFloat(inset))
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: UIScreen.main.bounds.width - 20, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
       
        guard let actionCell = cell as? ActionCell else { return UICollectionViewCell()
        }

        actionCell.username.text = dataSource[indexPath.row].username
        actionCell.action.text = dataSource[indexPath.row].action
        
        return actionCell
    }
}

