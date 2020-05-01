//
//  UserFeedPresenter.swift
//  Instagram
//
//  Created by Alina Gomeniuc on 5/1/20.
//  Copyright © 2020 Alina Gomeniuc. All rights reserved.
//

import Foundation

class UserFeedPresenter {
    private let userFeedService : UserFeedService
    weak private var userFeedViewDelegate : UserFeedViewDelegate?
    
    var userFeedData : Array<UserFeedCellModel> = Array()
    var nrOfPosts: Int {
        return userFeedData.count
    }
    
    init(userFeedService : UserFeedService){
        self.userFeedService = userFeedService
    }
    
    func setViewDelegate(userFeedViewDelegate : UserFeedViewDelegate?){
        self.userFeedViewDelegate = userFeedViewDelegate
    }
    
    func fetchUserFeedData(){
        self.userFeedViewDelegate?.showLoadingHUD()
        let _ = userFeedService.fetchUserFeedData()
                .subscribe {event in
                    var post : [FeedModel]
                    switch event {
                    case .next(let value):
                        post = value
                        for element in post {
                            guard let imageURL = URL(string: element.url) else { continue }
                            guard let imageData = try? Data(contentsOf: imageURL) else { continue }
                            let cell = UserFeedCellModel(id: element.id,
                                                         image: imageData,
                                                         postId: element.postId,
                                                         username: element.username,
                                                         likes: element.likes,
                                                         comments: element.comments)
                            self.userFeedData.append(cell)
                }
                    case .error(let error):
                         print(error)

                    case .completed:
                        self.userFeedViewDelegate?.hideLoadingHUD()
                        self.userFeedViewDelegate?.refrashUserFeedView()

                    }
                }
    }
    
    func configureCell(cell: UserFeedCell, forRow row: Int){
        let post = userFeedData[row]
        cell.displayComments(commentsText: post.comments)
        cell.displayLikes(actionText: post.likes)
        cell.displayUsername(usernameText: post.username)
        cell.displayImage(imageData: post.image)
    }
}
