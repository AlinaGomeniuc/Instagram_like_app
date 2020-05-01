//
//  ProfileFeedPresenter.swift
//  Instagram
//
//  Created by Alina Gomeniuc on 5/1/20.
//  Copyright © 2020 Alina Gomeniuc. All rights reserved.
//

import Foundation

class ProfileFeedPresenter {
    private let profileService : ProfileService
    weak private var profileFeedViewDelegate : ProfileFeedViewDelegate?

    var profileFeedData : Array<PostCellModel> = Array()
    var nrOfPosts: Int {
        return profileFeedData.count
    }

    init(profileService : ProfileService){
        self.profileService = profileService
    }

    func setViewDelegate(profileFeedViewDelegate : ProfileFeedViewDelegate?){
        self.profileFeedViewDelegate = profileFeedViewDelegate
    }
    
    func fetchProfileFeedData(){
        self.profileFeedViewDelegate?.showLoadingHUD()
        let _ = profileService.fetchProfileFeedData()
                .subscribe {event in
                    var post : [PostModel]
                    switch event {
                    case .next(let value):
                        post = value
                        for element in post {
                            guard let imageURL = URL(string: element.url) else { continue }
                            guard let imageData = try? Data(contentsOf: imageURL) else { continue }
                            let cell = PostCellModel(id: element.id,
                                                     image: imageData)
                            self.profileFeedData.append(cell)
                }
                    case .error(let error):
                         print(error)

                    case .completed:
                        self.profileFeedViewDelegate?.hideLoadingHUD()
                        self.profileFeedViewDelegate?.refrashProfileFeedView()

                    }
                }
    }
    
    func fetchProfileData(){
        let _ = profileService.fetchProfileData()
                .subscribe {event in
                    var post : [ProfileModel]
                    switch event {
                    case .next(let value):
                     post = value
                     for element in post {
                        self.profileFeedViewDelegate?.setUsername(username: element.username)
                        self.profileFeedViewDelegate?.setBio(bioInfo: element.bio)
                        self.profileFeedViewDelegate?.setFolowingNr(folowingNr: element.following)
                        self.profileFeedViewDelegate?.setFolowersNr(folowersNr: element.followers)
                        self.profileFeedViewDelegate?.setPostNr(postNr: element.posts)
                     }
                        
                    case .error(let error):
                         print(error)
        
                    case .completed:
                     print("completed")
                    }
                }
    }
    
    func configureCell(cell: PostCell, forRow row: Int){
        let post = profileFeedData[row]
        cell.displayImage(imageData: post.image)
    }
}
