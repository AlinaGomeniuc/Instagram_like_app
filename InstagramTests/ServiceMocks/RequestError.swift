//
//  RequestError.swift
//  InstagramTests
//
//  Created by Alina Gomeniuc on 5/25/20.
//  Copyright © 2020 Alina Gomeniuc. All rights reserved.
//

enum RequestFailureReason: Int, Error {
       case invalidRequest = 400
       case notFound = 404
   }
