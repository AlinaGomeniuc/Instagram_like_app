//
//  FeedPresenter.swift
//  Instagram
//
//  Created by Alina Gomeniuc on 4/30/20.
//  Copyright © 2020 Alina Gomeniuc. All rights reserved.
//

import Foundation

class FeedPresenter {
    private let feedService : FeedService
    weak private var feedViewDelegate : FeedViewDelegate?
    
    var feedData : Array<FeedCellModel> = Array()
    var nrOfPosts: Int {
        return feedData.count
    }
    
    init(feedService : FeedService){
        self.feedService = feedService
    }
    
    func setViewDelegate(feedViewDelegate : FeedViewDelegate?){
        self.feedViewDelegate = feedViewDelegate
    }
    
    func fetchFeedData(){
        self.feedViewDelegate?.showLoadingHUD()
        let _ = feedService.fetchFeedData()
                .subscribe {event in
                    var post : [GeneralFeedModel]
                    switch event {
                    case .next(let value):
                        post = value
                        for element in post {
                            guard let imageURL = URL(string: element.url) else { continue }
                            guard let imageData = try? Data(contentsOf: imageURL) else { continue }
                            let cell = FeedCellModel(id: element.id,
                                                     image: imageData)
                            self.feedData.append(cell)
                }
                    case .error(let error):
                         print(error)

                    case .completed:
                        self.feedViewDelegate?.hideLoadingHUD()
                        self.feedViewDelegate?.refrashFeedView()

                    }
                }
    }
    
    func configureCell(cell: FeedCell, forRow row: Int){
        let post = feedData[row]
        cell.displayImage(imageData: post.image)
    }
}
