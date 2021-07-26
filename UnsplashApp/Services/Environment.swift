//
//  Environment.swift
//  UnsplashApp
//
//  Created by KEEN on 2021/07/26.
//

import Foundation

protocol Environment {
  var apiService: APIService { get }
  var imageRepository: ImageRepository { get }
}

final class UnsplashEnvironment: Environment {
  var apiService: APIService
  var imageRepository: ImageRepository
  
  init(apiService: APIService,
       imageRepository: ImageRepository) {
    self.apiService = apiService
    self.imageRepository = imageRepository
  }
}
