//
//  ImageRespotiory.swift
//  UnsplashApp
//
//  Created by KEEN on 2021/06/27.
//

import Foundation

protocol ImageRepositoryType {
  var count: Int { get }
  func add(item: UnsplashType)
  func remove(item: UnsplashType)
  func fetch() -> [UnsplashType]
}

final class ImageRepository: ImageRepositoryType {
  var storedImages: [UnsplashType] = []
  
  var count: Int {
    return storedImages.count
  }
  
  func add(item: UnsplashType) {
    storedImages.append(item)
  }
  
  func remove(item: UnsplashType) {
    storedImages = storedImages.filter{ $0.id != item.id }
  }
  
  func fetch() -> [UnsplashType] {
    // 나중에
    return []
  }
  
}
