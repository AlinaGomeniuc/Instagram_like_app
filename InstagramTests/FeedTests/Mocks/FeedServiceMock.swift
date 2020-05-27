//
//  FeedServiceMock.swift
//  InstagramTests
//
//  Created by Alina Gomeniuc on 5/26/20.
//  Copyright © 2020 Alina Gomeniuc. All rights reserved.
//

import RxSwift
@testable import Instagram

class FeedServiceMock: FeedServiceProtocol {
    
      let feedList: [GeneralFeedModel]
      var request: RequestMock<GeneralFeedModel>!
      var isSuccesful = false
      
      init(feedList: [GeneralFeedModel]) {
          self.feedList = feedList
      }
    
      func fetchFeedData() -> Observable<[GeneralFeedModel]> {
          request = RequestMock()
          if (isSuccesful){
              request.result = .success(payload: feedList)
          } else {
              let error: Error = RequestFailureReason.notFound
              request.result = .failure(error)
          }
          return request.get().observeOn(MainScheduler.instance);
      }
}
